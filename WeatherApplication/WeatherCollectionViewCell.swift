//
//  WeatherCollectionViewCell.swift
//  WeatherApplication
//
//  Created by Nuthan Raju Pesala on 23/06/21.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WeatherCollectionViewCell"
    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor.white
        return iv
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(dayLabel)
    addSubview(iconImageView)
    addSubview(tempLabel)
    
    dayLabel.text = "Mon"
    iconImageView.image = UIImage(systemName: "cloud")
    tempLabel.text = "18°C"
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        dayLabel.frame = CGRect(x: 0, y: 8, width: frame.width, height: 20)
        iconImageView.frame = CGRect(x: 0, y: 30, width: frame.width, height: 40)
        tempLabel.frame = CGRect(x: 0, y: 72, width: frame.width, height: 20)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
