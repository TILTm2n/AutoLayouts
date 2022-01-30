//
//  ForecastViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 24.01.2022.
//

import UIKit

class ForecastViewController: UIViewController {

    let forecastLabel = UILabel()
    let todayLabel = UILabel()
    let dateLabel = UILabel()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(todayLabel)
        view.addSubview(dateLabel)
        
        setForecastLabel()
        setForecastLabelConstraints()
        
        setTodayLabel()
        setTodayLabelConstrints()
        
        setDateLabel()
        setDateLabelConstrints()
        
        setCollectionView()
        setCollectionViewConstraints()
        
    }
    
    func setForecastLabel(){
        view.addSubview(forecastLabel)
        forecastLabel.text = "Forecast Report"
        //forecastLabel.font = UIFont(name: "RobotoSlab-Medium", size: 30)
        forecastLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        forecastLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        forecastLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        forecastLabel.layer.shadowOpacity = 0.5
        forecastLabel.textAlignment = .center
        
    }
    
    func setForecastLabelConstraints(){
        forecastLabel.translatesAutoresizingMaskIntoConstraints = false
        forecastLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45.0).isActive = true
        forecastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func setTodayLabel(){
        todayLabel.text = "Today"
        todayLabel.textColor = .black
        todayLabel.font = UIFont(name: "RobotoSlab-Light", size: 15)
    }
    
    func setTodayLabelConstrints(){
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.topAnchor.constraint(equalTo: forecastLabel.bottomAnchor, constant: 30).isActive = true
        todayLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 28.0).isActive = true
        todayLabel.rightAnchor.constraint(equalTo: dateLabel.leftAnchor).isActive = true
    }
    
    func setDateLabel(){
        dateLabel.text = "Jan 30,2022"
        dateLabel.textAlignment = .right
        dateLabel.textColor = .black
        dateLabel.font = UIFont(name: "RobotoSlab-Light", size: 15)
    }
    
    func setDateLabelConstrints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: forecastLabel.bottomAnchor, constant: 30).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -28.0).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: todayLabel.rightAnchor).isActive = true
    }
    
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {return}
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: ForecastCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(named: "mainBGLight")
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setCollectionViewConstraints(){
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 10).isActive = true
        collectionView?.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0.0).isActive = true
        collectionView?.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: 85).isActive = true
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

extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 166.0, height: 85.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
