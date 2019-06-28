//
//  Constants.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]
typealias responseCallBack = ((Bool, String?) -> ())
typealias requestCallBack = ((Any, String?) -> ())

enum AirLine {
    case AirIndia
    case GoAir
    case Indigo
    case JetAirways
    case SpiceJet
}
enum City {
    case NewDelhi
    case Mumbai
}
enum FlightClass {
    case Business
    case Economy
}
class APIGet {
    static var sampleFlights = "https://www.ixigo.com/sampleFlightData"
}
