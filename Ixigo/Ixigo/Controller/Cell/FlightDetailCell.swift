//
//  FlightDetailCell.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

class FlightDetailCell: UITableViewCell {

    @IBOutlet weak var totalDuration: UILabel!
    @IBOutlet weak var destinationCode: UILabel!
    @IBOutlet weak var arrivalTime: UILabel!
    @IBOutlet weak var originCode: UILabel!
    @IBOutlet weak var departureTime: UILabel!
    @IBOutlet weak var fare: UILabel!
    @IBOutlet weak var flightClass: UILabel!
    @IBOutlet weak var flightName: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
// Default Methods
extension FlightDetailCell {
    func loadData(data: Flight) {
        switch data.airline! {
        case .AirIndia:
            logo.image = UIImage(named: "airindia")
            flightName.text = "Air India"
        case .GoAir:
            logo.image = UIImage(named: "goair")
            flightName.text = "Go Air"
        case .Indigo:
            logo.image = UIImage(named: "indigo")
            flightName.text = "Indigo"
        case .JetAirways:
            logo.image = UIImage(named: "jetairways")
            flightName.text = "Jet Airways"
        case .SpiceJet:
            logo.image = UIImage(named: "spicejet")
            flightName.text = "SpiceJet"
        }
        flightClass.text = data.flightClass
        fare.text = "₹ " + data.price.stringWithCommas(roundedTo: 0)
        originCode.text = data.origin
        destinationCode.text = data.destination
        departureTime.text = timeFormatter.string(from: data.takeoffTime)
        arrivalTime.text = timeFormatter.string(from: data.landingTime)
        totalDuration.text = getDuration(start: data.takeoffTime, end: data.landingTime)
    }
}
