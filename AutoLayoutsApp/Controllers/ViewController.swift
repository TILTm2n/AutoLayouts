//
//  ViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {

    let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(firstView)
        //createFirstViewConstraint()
        
        
        
    }
    
    fileprivate func createFirstViewConstraint() {
        firstView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        firstView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        firstView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5.0).isActive = true
    }


}

