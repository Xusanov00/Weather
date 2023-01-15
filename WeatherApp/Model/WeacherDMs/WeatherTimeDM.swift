//
//  WeatherTimeDM.swift
//  WeatherApp
//
//  Created by Ali on 22/12/22.
//

import UIKit
import SwiftyJSON


struct WeatherTimeDM {
    var high_temp: Double
    var low_temp: Double
    var conditionImg: String
    var time: String
    
    
    init(json: JSON) {
        
        self.high_temp = json["high_temp"].doubleValue
        self.low_temp = json["low_temp"].doubleValue
        self.conditionImg = json["weather"]["icon"].stringValue
        self.time = json["valid_date"].stringValue
        
    }
}
