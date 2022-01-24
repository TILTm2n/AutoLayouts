//
//  CustomTabBarController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 23.01.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = UIColor(named: "tabBarColorLight")
        self.tabBar.layer.cornerRadius = 10
        
    }

}
