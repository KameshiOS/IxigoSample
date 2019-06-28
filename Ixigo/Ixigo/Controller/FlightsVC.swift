//
//  FlightsVC.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

class FlightsVC: UIViewController, Alert {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get Flight List from API
        getFlightList()
    }
    
}
// MARK:- Default Methods
extension FlightsVC {
    func getFlightList() {
        FlightsVM.shared.getFlights { (success, error) in
            if success {
            } else {
                self.alert(title: "Alert!", message: error!)
            }
        }
    }
}
