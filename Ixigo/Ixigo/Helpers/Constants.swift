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
enum Sorting {
    case priceLow
    case priceHigh
    case takeLow
    case takeHigh
    case landLow
    case landHigh
}
class APIGet {
    static var sampleFlights = "https://www.ixigo.com/sampleFlightData"
}
