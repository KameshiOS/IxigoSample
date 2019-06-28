//
//  FlightsVM.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import Foundation

public class FlightsVM {
    public static let shared = FlightsVM()
    private init() {}
    
    var flights = [Flight]()
    func getFlights(completion: @escaping responseCallBack) {
        GetRequest.getMethod(getURL: APIGet.sampleFlights) { (response, error) in
            if error == "nil" {
                if let json = response as? JSONDictionary {
                    self.parseFlights(json: json)
                    completion(true, "")
                } else {
                    completion(false, "Error parsing flight details")
                }
            } else {
                completion(false, error)
            }
        }
    }
    // MARK:- Private Methods to Parse Flight Details
    private func parseFlights(json: JSONDictionary) {
        flights.removeAll()
        if let datas = json["flightsData"] as? [JSONDictionary] {
            for data in datas {
                let airlineCode = data["airlineCode"] as! String
                let flightClass = data["class"] as! String
                let destination = data["destinationCode"] as! String
                let landing = data["landingTime"] as! String
                let origin = data["originCode"] as! String
                let price = data["price"] as! String
                let takeoff = data["takeoffTime"] as! String
                let flight = Flight(airline: getAirline(code: airlineCode), flightClass: getFlightClass(name: flightClass), destination: getCity(code: destination), landingTime: Date(milliseconds: Int(landing)!), origin: getCity(code: origin), price: Int(price) ?? 0, takeoffTime: Date(milliseconds: Int(takeoff)!))
                flights.append(flight)
            }
        }
    }
}
extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
