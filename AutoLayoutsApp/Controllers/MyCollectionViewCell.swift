//
//  MyCollectionViewCell.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 26.01.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CityCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "custom"
        label.backgroundColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 10
        //contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 5, y: 5, width: 80, height: 80)
    }
    
}
