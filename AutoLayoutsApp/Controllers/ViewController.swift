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
        
        locationItem = UITabBarItem(title: "My Location", image: UIImage(named: "location"), selectedImage: UIImage(named: "locationSelected"))
        searchItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), selectedImage: UIImage(named: "searchSelected"))
        forecastItem = UITabBarItem(title: "Forecast", image: UIImage(named: "forecast"), selectedImage: UIImage(named: "forecastSelected"))
        settingsItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 3)
        
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
        present(tabBarC, animated: true, completion: nil)
    }
}

