//
//  Collection.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 12.02.2022.
//

import Foundation
import UIKit

struct CustomCollection {
    let layout: UICollectionViewFlowLayout
    var collectionView: UICollectionView
    
    init(){
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "mainBGLight")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.identifier)
    }
    
    
}
