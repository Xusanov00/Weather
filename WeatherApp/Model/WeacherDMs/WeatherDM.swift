//
//  WeatherDM.swift
//  WeatherApp
//
//  Created by Ali on 23/12/22.
//

import Foundation
import SwiftyJSON


struct WeatherDM {
    
    var city_name:  String
    var icon:       String
    var date:       String
    var temp:       Double
    var weather:    String
    var wind_spd:   Double
    var hum:        Int
    
    init(json: JSON) {
        
        self.city_name  = json["city_name"].stringValue
        self.icon       = json["weather"]["icon"].stringValue
        self.date       = json["ob_time"].stringValue
        self.temp       = json["temp"].doubleValue
        self.weather    = json["weather"]["description"].stringValue
        self.wind_spd   = json["wind_spd"].doubleValue
        self.hum        = json["rh"].intValue

    }
}

