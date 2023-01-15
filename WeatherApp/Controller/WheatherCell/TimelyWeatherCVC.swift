//
//  TimelyWeatherCVC.swift
//  WeatherApp
//
//  Created by Ali on 22/12/22.
//

import UIKit

class TimelyWeatherCVC: UICollectionViewCell {
    
    static func nib() -> UINib {
        UINib(nibName: "TimelyWeatherCVC", bundle: nil)
    }
    static let id = "TimelyWeatherCVC"
   
    

    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var conditionImg: UIImageView!
    @IBOutlet weak var timeLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCurrentTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        return String(hour)
    }
    
    //MARK: update weather time cell
    func updateCell(cell: WeatherTimeDM) {
        temperatureLbl.text = String(cell.high_temp) + "/" + String(cell.low_temp)
        conditionImg.image = UIImage(named: String(cell.conditionImg))
        timeLbl.text = String(cell.time.suffix(2))
    }
    
}
