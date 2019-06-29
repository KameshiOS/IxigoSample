//
//  ETicketVC.swift
//  Ixigo
//
//  Created by Kamesh on 29/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

class ETicketVC: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var flightClass: UILabel!
    @IBOutlet weak var landingTime: UILabel!
    @IBOutlet weak var takeOffTime: UILabel!
    @IBOutlet weak var departureDate: UILabel!
    @IBOutlet weak var ticketCount: UILabel!
    @IBOutlet weak var originCode: UILabel!
    @IBOutlet weak var destinationCode: UILabel!
    @IBOutlet weak var flightName: UILabel!
    @IBOutlet weak var flightLogo: UIImageView!
    
    var flight: Flight!
    var passenger: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateView(data: flight)
    }
    @IBAction func BackButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
// Default Method
extension ETicketVC {
    func updateView(data: Flight) {
        switch data.airline! {
        case .AirIndia:
            flightLogo.image = UIImage(named: "airindia")
            flightName.text = "Air India"
        case .GoAir:
            flightLogo.image = UIImage(named: "goair")
            flightName.text = "Go Air"
        case .Indigo:
            flightLogo.image = UIImage(named: "indigo")
            flightName.text = "Indigo"
        case .JetAirways:
            flightLogo.image = UIImage(named: "jetairways")
            flightName.text = "Jet Airways"
        case .SpiceJet:
            flightLogo.image = UIImage(named: "spicejet")
            flightName.text = "SpiceJet"
        }
        originCode.text = data.origin
        destinationCode.text = data.destination
        if passenger == 1 {
            ticketCount.text = "\(passenger) Flight Ticket"
        } else {
            ticketCount.text = "\(passenger) Flight Tickets"
        }
        departureDate.text = dateFormatter.string(from: data.takeoffTime)
        takeOffTime.text = timeFormatter.string(from: data.takeoffTime)
        landingTime.text = timeFormatter.string(from: data.landingTime)
        flightClass.text = data.flightClass
        priceLabel.text = "₹ " + (data.price * passenger).stringWithCommas(roundedTo: 0)
    }
}
