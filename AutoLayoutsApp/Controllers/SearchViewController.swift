//
//  SearchViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 24.01.2022.
//

import UIKit

class SearchViewController: UIViewController {

    let titleStack = UIStackView()
    let header = UILabel()
    let detail = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        self.view.addSubview(titleStack)
        
        setStackView()
        setStackViewConstraits()
        titleStack.addArrangedSubview(header)
    }
    
    func setHeader(){
        header.text = "Pick a location"
        header.font = UIFont(name: "RobotoSlab", size: 30.0)
        header.textAlignment = .center
        header.textColor = .white
    }
    
    func setStackView(){
        titleStack.axis = .vertical
        titleStack.spacing = 3.0
        titleStack.backgroundColor = .red
    }
    
    func setStackViewConstraits(){
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        titleStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
        titleStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -55).isActive = true
        titleStack.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 55).isActive = true
        titleStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    

    
}
