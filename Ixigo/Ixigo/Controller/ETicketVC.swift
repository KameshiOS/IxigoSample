//
//  ETicketVC.swift
//  Ixigo
//
//  Created by Kamesh on 29/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

class ETicketVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func BackButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
