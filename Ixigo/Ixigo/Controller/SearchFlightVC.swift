//
//  SearchFlightVC.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

class SearchFlightVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SearchButtonAction(_ sender: Any) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "FlightsVC") as! FlightsVC
        navigationController?.pushViewController(destVC, animated: true)
    }
}
