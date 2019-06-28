//
//  Helper.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import Foundation

var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM, YYYY"
    return formatter
}()
var timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()

func getDuration(start: Date, end: Date) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .day, .weekOfMonth]
    formatter.unitsStyle = .short
    let duration = formatter.string(from: start, to: end)!
    
    return duration
}
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
