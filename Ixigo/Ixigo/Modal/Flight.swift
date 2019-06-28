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
    var flightClass: String!
    var destination: String!
    var landingTime: Date!
    var origin: String!
    var price: Int!
    var takeoffTime: Date!
    
    init(airline: AirLine, flightClass: String, destination: String, landingTime: Date, origin: String, price: Int, takeoffTime: Date!) {
        self.airline = airline
        self.flightClass = flightClass
        self.destination = destination
        self.landingTime = landingTime
        self.origin = origin
        self.price = price
        self.takeoffTime = takeoffTime
    }
}
