//
//  LocationViewController.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 24.01.2022.
//

import UIKit

enum ValueType{
    case Temperature
    case Humidity
    case Wind
}

class LocationViewController: UIViewController {
    
    let valuesDock = UIView()
    
    //MARK: - Scroll View
    lazy var scrollView = CustomScrollView(frame: self.view.frame).scrollView
    
    //MARK: - Location Label
    lazy var locationLabel = LocationLabel(frame: view.frame, text: "Simpheropol Crimea").label
    
    //MARK: - Date label
    let dateLabel = DateLabel(text: "Jan 30,2022").label
    
    //MARK: - Icon
    let icon = Icon(iconName: "cloudy").iconImage
    
    //MARK: - Temperature
    let temperature = Temperature(temp: 28).label
    
    // MARK: - Today Label
    let todayLabel = Today().label
    
    // MARK: - Collection View
    var collectionView = CustomCollection().collectionView
    
    // MARK: - Custom StackView
    let customStackView = CustomStackView()
    
    lazy var ibgRefreshControl : UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutIncludesOpaqueBars = true
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(scrollView)
        scrollView.addSubview(icon)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(valuesDock)
        scrollView.addSubview(todayLabel)
        scrollView.addSubview(temperature)
        scrollView.addSubview(locationLabel)
        scrollView.addSubview(collectionView)
        
        scrollView.addSubview(customStackView.stackView)
        
        scrollView.refreshControl = ibgRefreshControl
        collectionView.delegate = self
        collectionView.dataSource = self
        
        customStackView.changeValues(temp: 12, humidity: 34, speed: 56)
        
        setConstraints()
        
        //setValuesDock()
    }
    
    func setConstraints(){
        
        //MARK: - Scroll View Constraints
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        //MARK: - Location Label Constraints
        NSLayoutConstraint.activate([
            locationLabel.heightAnchor.constraint(equalToConstant: 40.0),
            locationLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            locationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45.0)
        ])
        
        //MARK: - Date label Constraints
        NSLayoutConstraint.activate([
            dateLabel.heightAnchor.constraint(equalToConstant: 20.0),
            dateLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5)
        ])
        
        //MARK: - Icon Constaints
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 155.0),
            icon.heightAnchor.constraint(equalToConstant: 155.0),
            icon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            icon.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24.0)
        ])
        
        //MARK: - Temperature Constraints
        NSLayoutConstraint.activate([
            temperature.heightAnchor.constraint(equalToConstant: 92),
            temperature.topAnchor.constraint(equalTo: icon.bottomAnchor),
            temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // MARK: - Today Label Constraints
        NSLayoutConstraint.activate([
            todayLabel.heightAnchor.constraint(equalToConstant: 26),
            todayLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24.0),
            todayLabel.topAnchor.constraint(equalTo: customStackView.stackView.bottomAnchor, constant: 31.0)
        ])
        
        // MARK: - Collection View Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 24),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 85)
        ])
        
        // MARK: - Custom StackView
        NSLayoutConstraint.activate([
//            customStackView.stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//            customStackView.stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            customStackView.stackView.topAnchor.constraint(equalTo: label.topAnchor, constant: 30),
//            customStackView.stackView.heightAnchor.constraint(equalToConstant: 46),
            
            customStackView.stackView.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 100.0),
            customStackView.stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            customStackView.stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            customStackView.stackView.heightAnchor.constraint(equalToConstant: 46.0)

        ])
    }

extension LocationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 166.0, height: 85.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}
