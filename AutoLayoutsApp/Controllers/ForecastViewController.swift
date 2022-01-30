//
//  ForecastViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 24.01.2022.
//

import UIKit

class ForecastViewController: UIViewController {

    let forecastLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(forecastLabel)
        
        setForecastlabel()
        setForecastlabelConstraints()
    }
    
    func setForecastlabel(){
        forecastLabel.text = "Forecast Report"
        //forecastLabel.font = UIFont(name: "RobotoSlab-Medium", size: 30)
        forecastLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        forecastLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        forecastLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        forecastLabel.layer.shadowOpacity = 0.5
        forecastLabel.textAlignment = .center
        
    }
    
    func setForecastlabelConstraints(){
        forecastLabel.translatesAutoresizingMaskIntoConstraints = false
        forecastLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45.0).isActive = true
        forecastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
