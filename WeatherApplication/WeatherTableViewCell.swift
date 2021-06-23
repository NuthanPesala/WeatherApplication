//
//  WeatherTableViewCell.swift
//  WeatherApplication
//
//  Created by Nuthan Raju Pesala on 22/06/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    static let identifier = "WeatherTableViewCell"
    
    static func createNib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
