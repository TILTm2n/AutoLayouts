//
//  Icon.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 12.02.2022.
//

import Foundation
import UIKit

struct Icon {
    var iconImage = UIImageView()
    
    init(iconName: String){
        iconImage.contentMode = .scaleAspectFill
        iconImage.image = UIImage(named: iconName)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setImage(image withName: String) {
        iconImage.image = UIImage(named: withName)
    }
}
