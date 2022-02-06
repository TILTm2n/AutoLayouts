//
//  WeatherIconManager.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 06.02.2022.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case UnpredictedIcon = "unpredicted-icon"
    
    init(rawValue: String){
        switch rawValue {
        case "clear-day": self = .ClearDay
        case "clear-night": self = .ClearNight
        default: self = .UnpredictedIcon
        }
    }
}

extension WeatherIconManager {
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
