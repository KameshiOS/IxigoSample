//
//  FlightsVC.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

class FlightsVC: UIViewController, Alert {

    @IBOutlet weak var flightDetailTable: UITableView!
    @IBOutlet var sortTable: UITableView!
    
    var passenger = 1
    var flightClass = "Any"
    
    var filteredFlights: [Flight]!
    var isFiltered = false
    var sortedFlights: [Flight]!
    var isSorted = false
    
    var dimView = UIView()
    var selectedIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeDelegates()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get Flight List from API
        getFlightList()
    }
    @IBAction func SortButtonAction(_ sender: Any) {
        // Open Sort view with bottom animation
        openSortView()
    }
    @IBAction func BackButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK:- Tableview delegate methods for Sort Tableview & Flights Tableview
extension FlightsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == sortTable {
            return 1
        }
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sortTable {
            return sortArray.count
        } else {
            if section == 1 {
                if isSorted {
                    return sortedFlights.count
                } else {
                    if isFiltered {
                        return filteredFlights.count
                    }
                    return FlightsVM.shared.flights.count
                }
            }
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == sortTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SortCell
            cell.sortImage.image = UIImage(named: sortArray[indexPath.row].image)
            cell.sortLabel.text = sortArray[indexPath.row].name
            if selectedIndex == indexPath.row {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        } else {
            if indexPath.section == 0 {
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! SearchDetailCell
                cell1.departDate.text = "Depart: " + dateFormatter.string(from: FlightsVM.shared.flights.first?.takeoffTime ?? Date())
                cell1.passengerLabel.text = "\(passenger) Adult"
                cell1.flightClassLabel.text = flightClass
                return cell1
            } else {
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! FlightDetailCell
                cell2.passenger = passenger
                if isSorted {
                    cell2.loadData(data: sortedFlights[indexPath.row])
                } else {
                    if isFiltered {
                        cell2.loadData(data: filteredFlights[indexPath.row])
                    } else {
                        cell2.loadData(data: FlightsVM.shared.flights[indexPath.row])
                    }
                }
                return cell2
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sortTable {
            // Sorting the flights based on the selection done on the tableview
            if indexPath.row == 0 {
                sortflights(sorting: .priceLow)
            } else if indexPath.row == 1 {
                sortflights(sorting: .priceHigh)
            } else if indexPath.row == 2 {
                sortflights(sorting: .takeLow)
            } else if indexPath.row == 3 {
                sortflights(sorting: .takeHigh)
            } else if indexPath.row == 4 {
                sortflights(sorting: .landLow)
            } else {
                sortflights(sorting: .landHigh)
            }
            selectedIndex = indexPath.row
            DispatchQueue.main.async {
                self.sortTable.reloadData()
                self.closeSortView()
                // Scrolled back to first section on each sort selection
                self.flightDetailTable.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        } else {
            // Pushing the ticket details to ETicket View controller
            let destVC = storyboard?.instantiateViewController(withIdentifier: "ETicketVC") as! ETicketVC
            if isSorted {
                destVC.flight = sortedFlights[indexPath.row]
            } else {
                if isFiltered {
                    destVC.flight = filteredFlights[indexPath.row]
                } else {
                    destVC.flight = FlightsVM.shared.flights[indexPath.row]
                }
            }
            destVC.passenger = passenger
            navigationController?.pushViewController(destVC, animated: true)
        }
    }
}
// MARK:- Default Methods
extension FlightsVC {
    func initializeDelegates() {
        flightDetailTable.delegate = self
        flightDetailTable.dataSource = self
        
        sortTable.delegate = self
        sortTable.dataSource = self
        sortTable.tableFooterView = UIView()
        sortTable.isScrollEnabled = false
    }
    func getFlightList() {
        FlightsVM.shared.getFlights { (success, error) in
            if success {
                // Check for filter option
                self.filterFlight()
                DispatchQueue.main.async {
                    self.flightDetailTable.reloadData()
                }
            } else {
                self.alert(title: "Alert!", message: error!)
            }
        }
    }
    func filterFlight() {
        if flightClass == "Any" {
            isFiltered = false
        } else if flightClass == "Economy" {
            isFiltered = true
            filteredFlights = FlightsVM.shared.flights.filter({ $0.flightClass == flightClass })
        } else {
            isFiltered = true
            filteredFlights = FlightsVM.shared.flights.filter({ $0.flightClass == flightClass })
        }
        // Setting up default initial sort option. Sorting the flights array in descending order
        self.sortflights(sorting: .priceLow)
    }
    func sortflights(sorting: Sorting) {
        isSorted = true
        switch sorting {
        case .priceLow:
            if isFiltered {
                sortedFlights = filteredFlights.sorted(by: { $0.price < $1.price })
            } else {
                sortedFlights = FlightsVM.shared.flights.sorted(by: { $0.price < $1.price })
            }
        case .priceHigh:
            if isFiltered {
                sortedFlights = filteredFlights.sorted(by: { $0.price > $1.price })
            } else {
                sortedFlights = FlightsVM.shared.flights.sorted(by: { $0.price > $1.price })
            }
        case .takeLow:
            if isFiltered {
                sortedFlights = filteredFlights.sorted(by: { $0.takeoffTime < $1.takeoffTime })
            } else {
                sortedFlights = FlightsVM.shared.flights.sorted(by: { $0.takeoffTime < $1.takeoffTime })
            }
        case .takeHigh:
            if isFiltered {
                sortedFlights = filteredFlights.sorted(by: { $0.takeoffTime > $1.takeoffTime })
            } else {
                sortedFlights = FlightsVM.shared.flights.sorted(by: { $0.takeoffTime > $1.takeoffTime })
            }
        case .landLow:
            if isFiltered {
                sortedFlights = filteredFlights.sorted(by: { $0.landingTime < $1.landingTime })
            } else {
                sortedFlights = FlightsVM.shared.flights.sorted(by: { $0.landingTime < $1.landingTime })
            }
        case .landHigh:
            if isFiltered {
                sortedFlights = filteredFlights.sorted(by: { $0.landingTime > $1.landingTime })
            } else {
                sortedFlights = FlightsVM.shared.flights.sorted(by: { $0.landingTime > $1.landingTime })
            }
        }
        DispatchQueue.main.async {
            self.flightDetailTable.reloadData()
        }
    }
    func openSortView() {
        // Navigation bar interaction is disabled in order to avoid opening sort view multiple time.
        navigationController?.navigationBar.isUserInteractionEnabled = false
        dimView.frame = view.frame
        dimView.backgroundColor = UIColor.black
        dimView.alpha = 0
        view.addSubview(dimView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeSortView))
        dimView.addGestureRecognizer(tap)
        
        sortTable.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: (CGFloat(sortArray.count) * 52) + 20)
        sortTable.layer.cornerRadius = 8
        view.addSubview(sortTable)
        
        // UIView Spring Animation is used to get smooth and neat UI Experience
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.dimView.alpha = 0.5
            self.sortTable.frame = CGRect(x: 0, y: self.view.frame.height - self.sortTable.frame.height + 20, width: self.sortTable.frame.width, height: self.sortTable.frame.height)
        }, completion: nil)
    }
    @objc func closeSortView() {
        navigationController?.navigationBar.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.dimView.alpha = 0
            self.sortTable.frame = CGRect(x: 0, y: self.view.frame.height, width: self.sortTable.frame.width, height: self.sortTable.frame.height)
        }, completion: nil)
    }
}
