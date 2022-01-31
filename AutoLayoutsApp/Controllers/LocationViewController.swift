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
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        return icon
    }()
    
    let temperature: UILabel = {
        var temperature = UILabel()
        temperature.text = "28C"
        temperature.font = UIFont(name: "RobotoSlab-Medium", size: 70)
        temperature.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return temperature
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(locationLabel)
        view.addSubview(dateLabel)
        view.addSubview(icon)
        view.addSubview(temperature)
        
        setLocationLabel()
        setLocationLabelConstraints()
        
        setDateLabel()
        setDateLabelConstraints()
        
        setIconConstraints()
        
        setTemperatureConstraints()
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
    
    func setIconConstraints(){
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24.0).isActive = true
        icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 155.0).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 155.0).isActive = true
        
    }

    func setTemperatureConstraints(){
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.topAnchor.constraint(equalTo: icon.bottomAnchor).isActive = true
        temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //temperature.heightAnchor.constraint(equalToConstant: 155.0).isActive = true
    }
}
