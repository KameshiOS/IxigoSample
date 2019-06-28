//
//  Helper.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import Foundation

func getAirline(code: String) -> AirLine {
    if code == "AI" {
        return .AirIndia
    } else if code == "G8" {
        return .GoAir
    } else if code == "IN" {
        return .Indigo
    } else if code == "JA" {
        return .JetAirways
    } else {
        return .SpiceJet
    }
}

func getCity(code: String) -> City {
    if code == "DEL" {
        return .NewDelhi
    } else {
        return .Mumbai
    }
}

func getFlightClass(name: String) -> FlightClass {
    if name == "Business" {
        return .Business
    } else {
        return .Economy
    }
}

extension Int {
    func stringWithCommas(roundedTo fractionDigits: Int?) -> String! {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        if let fractionDigits = fractionDigits {
            numberFormatter.minimumFractionDigits = fractionDigits
            numberFormatter.maximumFractionDigits = fractionDigits
        }
        
        return numberFormatter.string(from: NSNumber(integerLiteral: self))
    }
}
