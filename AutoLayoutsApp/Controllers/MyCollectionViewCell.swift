//
//  MyCollectionViewCell.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 26.01.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CityCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
