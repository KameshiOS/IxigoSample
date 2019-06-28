//
//  Flight.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import Foundation

struct Flight {
    var airline: AirLine!
    var flightClass: FlightClass!
    var destination: City!
    var landingTime: Date!
    var origin: City!
    var price: Int!
    var takeoffTime: Date!
    
    init(airline: AirLine, flightClass: FlightClass, destination: City, landingTime: Date, origin: City, price: Int, takeoffTime: Date!) {
        self.airline = airline
        self.flightClass = flightClass
        self.destination = destination
        self.landingTime = landingTime
        self.origin = origin
        self.price = price
        self.takeoffTime = takeoffTime
    }
}
