//
//  LoocationModel.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 04.02.2022.
//

import Foundation
import UIKit

struct LocationModel: Codable {
    
    let location: String
    //let date: Date
    let temperature: Double
    let appearentTemperature: Double
    let humidity: Double
    let wind: Double
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case location = "timezone"
        case temperature = "temp"
        case appearentTemperature = "feels_like"
        case humidity
        case wind = "wind_speed"
        case icon
    }
}
