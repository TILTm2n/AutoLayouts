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
        contentView.backgroundColor = .green
        contentView.layer.cornerRadius = 20
        //contentView.addSubview(myLabel)
        //contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
