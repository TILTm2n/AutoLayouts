//
//  LoocationModel.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 04.02.2022.
//

import Foundation

struct LocationModel: Codable {
    
    let userId: Int
    let postId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case postId
        case title
        case body
    }
}
