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
        self.tabBar.barTintColor = UIColor(named: "tabBarColorLight")
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.layer.cornerRadius = 25
        
    }

}
