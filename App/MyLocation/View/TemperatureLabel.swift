//
//  TemperatureLabel.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 12.02.2022.
//

import Foundation
import UIKit

struct Temperature {
    var label = UILabel()
    
    init(temp: Double){
        label.text = "\(temp)C"
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setTemperature(temperature: Int) {
        label.text = "\(Int(temperature))C"
    }
}
