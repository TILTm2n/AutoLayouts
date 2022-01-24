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
        
        let tabBarC = UITabBarController()
        tabBarC.modalPresentationStyle = .fullScreen
        tabBarC.tabBar.backgroundColor = UIColor(named: "tabBarColor")
        
    }

}
