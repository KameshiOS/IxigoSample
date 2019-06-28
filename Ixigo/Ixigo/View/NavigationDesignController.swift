//
//  NavigationDesignController.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

@IBDesignable class NavigationDesignController: UINavigationController {
    
    @IBInspectable var ifBackgroundWhite: Bool = false {
        didSet {
            viewDidLoad()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(setBackgroundWhite: ifBackgroundWhite)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad()
    }
}
extension UINavigationController {
    func updateViews(setBackgroundWhite: Bool) {
        if setBackgroundWhite {
            navigationBar.shadowImage = UIImage()
            navigationBar.tintColor = UIColor.white
            navigationBar.barTintColor = UIColor.white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 35/255, green: 47/255, blue: 61/255, alpha: 1)]
            
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.white
            
            navigationBar.layer.masksToBounds = false
            navigationBar.layer.shadowColor = UIColor(displayP3Red: 4/255, green: 49/255, blue: 120/255, alpha: 1).cgColor
            navigationBar.layer.shadowOpacity = 0.6
            navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
            navigationBar.layer.shadowRadius = 4
            UIApplication.shared.statusBarStyle = .default
        } else {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.clear
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
}
