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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        flightDetailTable.delegate = self
        flightDetailTable.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get Flight List from API
        getFlightList()
    }
    @IBAction func BackButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension FlightsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return FlightsVM.shared.flights.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! SearchDetailCell
            cell1.departDate.text = dateFormatter.string(from: FlightsVM.shared.flights.first?.takeoffTime ?? Date())
            return cell1
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! FlightDetailCell
            cell2.loadData(data: FlightsVM.shared.flights[indexPath.row])
            return cell2
        }
    }
}
// MARK:- Default Methods
extension FlightsVC {
    func getFlightList() {
        FlightsVM.shared.getFlights { (success, error) in
            if success {
                DispatchQueue.main.async {
                    self.flightDetailTable.reloadData()
                }
            } else {
                self.alert(title: "Alert!", message: error!)
            }
        }
    }
}
