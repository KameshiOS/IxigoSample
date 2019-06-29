//
//  NavigationDesignController.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

// Comment: Custom Navigation Controller class to show transparent Navigation Bar
@IBDesignable class NavigationDesignController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad()
    }
}
extension UINavigationController {
    func updateViews() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // To show White status bar
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
