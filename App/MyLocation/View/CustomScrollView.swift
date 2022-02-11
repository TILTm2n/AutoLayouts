//
//  CustomScrollView.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 10.02.2022.
//

import Foundation
import UIKit

class CustomScrollView: UIScrollView {
    
    var scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.backgroundColor = .systemGreen
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        //scrollView.contentSize = CGSize(width: frame.size.width, height: frame.size.height + 5)
    }
    
    convenience init(frame: CGRect, neededView: UIView) {
        self.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
