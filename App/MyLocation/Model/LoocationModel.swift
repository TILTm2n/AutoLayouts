//
//  LoocationModel.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 04.02.2022.
//

import Foundation

struct LocationModel: Codable {
    
    let location: String
    let date: Date
    let temperature: Double
    let humidy: Double
    let wind: Double
    
    enum CodingKeys: String, CodingKey {
        case location
        case date
        case temperature
        case humidy
        case wind
    }
}
