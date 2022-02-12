//
//  LocationLabel.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 12.02.2022.
//

import UIKit

class LocationLabel: UILabel {

    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.textAlignment = .center
        label.layer.shadowOpacity = 0.5
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    convenience init(frame: CGRect, text: String) {
        self.init(frame: frame)
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
