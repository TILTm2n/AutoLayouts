//
//  ForecastTableViewCell.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 30.01.2022.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    static let identifier = "TableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    let temperature: UILabel = {
        var temperature = UILabel()
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.text = "28C"
        temperature.font = UIFont(name: "RobotoSlab-Medium", size: 17)
        temperature.textColor = .black
        return temperature
    }()
    
    let time: UILabel = {
        var time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.text = "10:00am"
        time.font = UIFont(name: "RobotoSlab-Medium", size: 12)
        time.textColor = .black
        return time
    }()
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
