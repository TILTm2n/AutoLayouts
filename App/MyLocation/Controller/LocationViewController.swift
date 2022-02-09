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

    let locationLabel = UILabel()
    let dateLabel = UILabel()
    let valuesDock = UIView()
    var collectionView: UICollectionView?
    var scrollView = UIScrollView()
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        //icon.image = UIImage(named: "rain")
        return icon
    }()
    
    let temperature: UILabel = {
        var temperature = UILabel()
        temperature.text = "28C"
        temperature.font = UIFont.boldSystemFont(ofSize: 70.0)
        temperature.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return temperature
    }()
    
    let todayLabel: UILabel = {
        var todayLabel = UILabel()
        todayLabel.text = "Today"
        todayLabel.textColor = UIColor(red: 1, green: 0.996, blue: 0.996, alpha: 1)
        todayLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return todayLabel
    }()
    
    lazy var ibgRefreshControl : UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(scrollView)
        scrollView.addSubview(locationLabel)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(icon)
        scrollView.addSubview(temperature)
        scrollView.addSubview(valuesDock)
        scrollView.addSubview(todayLabel)
        
        extendedLayoutIncludesOpaqueBars = true
        scrollView.refreshControl = ibgRefreshControl
        
        setScrollView()
        setScrollViewConstraints()
        
        setLocationLabel()
        setLocationLabelConstraints()
        
        setDateLabel()
        setDateLabelConstraints()
        
        setIconConstraints()
        
        setTemperatureConstraints()
        
        setCollectionView()
        setCollectionViewConstraints()
        
        setTodayLabelConstraints()
        
        setValuesDock()
        
    }
    
    //MARK: - Scroll View
    func setScrollView(){
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + 5)
    }
    
    func setScrollViewConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    //MARK: - Location Label
    func setLocationLabel(){
//        view.addSubview(locationLabel)
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
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45.0),
            locationLabel.heightAnchor.constraint(equalToConstant: 40.0),
            locationLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
    }
    
//    func setLocationLabelConstraints(){
//        locationLabel.translatesAutoresizingMaskIntoConstraints = false
//        locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45.0).isActive = true
//        //locationLabel.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
//        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//    }
    
    //MARK: - Date label
    func setDateLabel(){
        dateLabel.text = "Jan 30,2022"
        dateLabel.textAlignment = .right
        dateLabel.textColor = .white
        dateLabel.font = UIFont(name: "RobotoSlab-Light", size: 15)
        
    }
    
    func setDateLabelConstraints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            dateLabel.heightAnchor.constraint(equalToConstant: 20.0),
            dateLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    //MARK: - Icon
    func setIconConstraints(){
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24.0),
            icon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            icon.heightAnchor.constraint(equalToConstant: 155.0),
            icon.widthAnchor.constraint(equalToConstant: 155.0)
        ])
    }
    
    //MARK: - Temperature
    func setTemperatureConstraints(){
        temperature.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperature.topAnchor.constraint(equalTo: icon.bottomAnchor),
            temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperature.heightAnchor.constraint(equalToConstant: 92)
        ])
        
    }
    
    //MARK: - Values Block
    func createValueBlock(nameOfValue: String, valueOfValue: CGFloat, valueType: ValueType) -> UIView {
        let vBlock = UIView()
        vBlock.translatesAutoresizingMaskIntoConstraints = false
        vBlock.heightAnchor.constraint(equalToConstant: 46.0).isActive = true
        
        let nameValue = UILabel()
        nameValue.translatesAutoresizingMaskIntoConstraints = false
        nameValue.text = nameOfValue
        nameValue.font = UIFont.systemFont(ofSize: 15, weight: .light)
        nameValue.textColor = .white
        
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        value.textColor = .white
        
        if valueType == .Temperature{
            value.text = "\(valueOfValue)C"
        }else if valueType == .Humidity{
            value.text = "\(valueOfValue)%"
        }else if valueType == .Wind{
            value.text = "\(valueOfValue)km/h"
        }
        
        vBlock.addSubview(nameValue)
        vBlock.addSubview(value)
        
        NSLayoutConstraint.activate([
            nameValue.topAnchor.constraint(equalTo: vBlock.topAnchor),
            nameValue.centerXAnchor.constraint(equalTo: vBlock.centerXAnchor),
            value.bottomAnchor.constraint(equalTo: vBlock.bottomAnchor),
            value.topAnchor.constraint(equalTo: nameValue.bottomAnchor),
            value.centerXAnchor.constraint(equalTo: vBlock.centerXAnchor)
        ])
        
        return vBlock
    }
    
    func setValuesDock(){
        valuesDock.translatesAutoresizingMaskIntoConstraints = false
        let temp = createValueBlock(nameOfValue: "Temp", valueOfValue: 26, valueType: .Temperature)
        let humidy = createValueBlock(nameOfValue: "Humidity", valueOfValue: 26, valueType: .Humidity)
        let wind = createValueBlock(nameOfValue: "Wind", valueOfValue: 26, valueType: .Wind)
        
        valuesDock.addSubview(temp)
        valuesDock.addSubview(humidy)
        valuesDock.addSubview(wind)
        
        NSLayoutConstraint.activate([
            temp.leftAnchor.constraint(equalTo: valuesDock.leftAnchor),
            temp.topAnchor.constraint(equalTo: valuesDock.topAnchor),
            humidy.centerXAnchor.constraint(equalTo: valuesDock.centerXAnchor),
            humidy.topAnchor.constraint(equalTo: valuesDock.topAnchor),
            wind.rightAnchor.constraint(equalTo: valuesDock.rightAnchor),
            wind.topAnchor.constraint(equalTo: valuesDock.topAnchor),
            valuesDock.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 100.0),
            valuesDock.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            valuesDock.widthAnchor.constraint(equalToConstant: view.frame.size.width - 100),
            valuesDock.heightAnchor.constraint(equalToConstant: 46.0)
        ])
    }
    
    // MARK: - Today Label
    func setTodayLabelConstraints(){
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: valuesDock.bottomAnchor, constant: 31.0),
            todayLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24.0),
            todayLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
    }
    
    
    
    // MARK: - Collection View
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //guard let collectionView = collectionView else {return}
//        view.addSubview(collectionView!)
        scrollView.addSubview(collectionView!)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.identifier)
        collectionView?.backgroundColor = UIColor(named: "mainBGLight")
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    func setCollectionViewConstraints(){
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            (collectionView?.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 24))!,
            (collectionView?.widthAnchor.constraint(equalTo: scrollView.widthAnchor))!,
            (collectionView?.heightAnchor.constraint(equalToConstant: 85))!
        ])
        
        
//        collectionView?.translatesAutoresizingMaskIntoConstraints = false
//        collectionView?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -86).isActive = true
//        collectionView?.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        collectionView?.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
//        collectionView?.heightAnchor.constraint(equalToConstant: 85).isActive = true
    }

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
