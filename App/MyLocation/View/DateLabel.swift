//
//  dateLabel.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 12.02.2022.
//

import Foundation
import UIKit

struct DateLabel {
    var label = UILabel()
    
    init(text: String) {
        label.text = text
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "RobotoSlab-Light", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDate(_ date: String) {
        label.text = date
    }
    
    
}
