//
//  SettingsViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 24.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    let themeSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(themeSwitch)
        
        createSwitch()
        
        
        
    }
    
    func createSwitch(){
        themeSwitch.translatesAutoresizingMaskIntoConstraints = false
        themeSwitch.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        themeSwitch.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        themeSwitch.widthAnchor.constraint(equalToConstant: 200).isActive = true
        themeSwitch.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
