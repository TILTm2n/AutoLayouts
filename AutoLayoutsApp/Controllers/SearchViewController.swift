//
//  SearchViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 24.01.2022.
//

import UIKit

class SearchViewController: UIViewController {

    let titleStack = UIStackView()
    let searchStack = UIStackView()
    let header = UILabel()
    let detail = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        self.view.addSubview(titleStack)
        
        setStackView()
        setStackViewConstraits()
        
        titleStack.addArrangedSubview(header)
        titleStack.addArrangedSubview(detail)
        
        setHeader()
        setDetail()
        
    }
    
    
    
    func setHeader(){
        header.text = "Pick a location"
        header.layer.shadowOffset = CGSize(width: 5, height: 5)
        header.layer.shadowOpacity = 0.5
        header.shadowColor = .black
        header.font = UIFont.boldSystemFont(ofSize: 30.0)
        header.textAlignment = .center
        header.textColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        header.widthAnchor.constraint(equalTo: self.titleStack.widthAnchor).isActive = true
    }
    
    func setDetail(){
        detail.text = "Type the area or city you want to know the detailed weather information at this time."
        detail.layer.shadowOffset = CGSize(width: 5, height: 5)
        detail.layer.shadowOpacity = 0.5
        detail.font = UIFont.systemFont(ofSize: 15.0, weight: .light)
        detail.textAlignment = .center
        detail.textColor = .white
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.widthAnchor.constraint(equalTo: self.titleStack.widthAnchor).isActive = true
        detail.lineBreakMode = .byWordWrapping
        detail.numberOfLines = 3
        detail.baselineAdjustment = .alignCenters
        
    }
    
    func setStackView(){
        titleStack.axis = .vertical
        titleStack.spacing = 3.0
        titleStack.alignment = .center
    }
    
    func setStackViewConstraits(){
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        titleStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
        titleStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -55).isActive = true
        titleStack.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 55).isActive = true
        titleStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    

    
}
