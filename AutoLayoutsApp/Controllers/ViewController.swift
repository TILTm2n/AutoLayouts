//
//  ViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let locationVC = LocationViewController()
    let searchVC = SearchViewController()
    let forecastVC = ForecastViewController()
    let settingsVC = SettingsViewController()
    
    var locationItem = UITabBarItem()
    var searchItem = UITabBarItem()
    var forecastItem = UITabBarItem()
    var settingsItem = UITabBarItem()
    
    let tabBarC = CustomTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationItem = UITabBarItem(title: "My Location", image: UIImage(named: "location3x"), selectedImage: UIImage(named: "locationSelected"))
        searchItem = UITabBarItem(title: "Search", image: UIImage(named: "search3x"), selectedImage: UIImage(named: "searchSelected"))
        forecastItem = UITabBarItem(title: "Forecast", image: UIImage(named: "forecast3x"), selectedImage: UIImage(named: "forecastSelected"))
        settingsItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings3x"), tag: 3)
        
        locationVC.tabBarItem = locationItem
        searchVC.tabBarItem = searchItem
        forecastVC.tabBarItem = forecastItem
        settingsVC.tabBarItem = settingsItem
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tabBarC.setViewControllers([locationVC,
                                    searchVC,
                                    forecastVC,
                                    settingsVC], animated: true)
        tabBarC.tabBar.backgroundColor = UIColor(named: "tabBarColorLight")
        present(tabBarC, animated: true, completion: nil)
    }
}

