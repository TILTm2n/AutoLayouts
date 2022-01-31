//
//  LocationViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 24.01.2022.
//

import UIKit

class LocationViewController: UIViewController {

    let locationLabel = UILabel()
    let dateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(locationLabel)
        view.addSubview(dateLabel)
        
        setLocationLabel()
        setLocationLabelConstraints()
        
        setDateLabel()
        setDateLabelConstraints()
    }

    func setLocationLabel(){
        locationLabel.text = "Simpheropol Crimea"
        //locationLabel.font = UIFont(name: "RobotoSlab-Medium", size: 30)
        locationLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        locationLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        locationLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        locationLabel.layer.shadowOpacity = 0.5
        locationLabel.textAlignment = .center
        
    }
    
    func setLocationLabelConstraints(){
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45.0).isActive = true
        //locationLabel.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func setDateLabel(){
        dateLabel.text = "Jan 30,2022"
        dateLabel.textAlignment = .right
        dateLabel.textColor = .white
        dateLabel.font = UIFont(name: "RobotoSlab-Light", size: 15)
        
    }
    
    func setDateLabelConstraints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }

}
