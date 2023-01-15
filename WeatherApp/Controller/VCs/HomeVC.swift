//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Ali on 24/11/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeVC: UIViewController {
    
    
    
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var weatherDetailsView: UIView!
    @IBOutlet weak var weatherIconnImg: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var HumLbl: UILabel!
    @IBOutlet weak var speedOfWindLbl: UILabel!
    @IBOutlet weak var persentOfHumLbl: UILabel!
    @IBOutlet weak var typeOfSpeedLbl: UILabel!
    
    var currentWeatherArr: [WeatherDM] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
        self.navigationController?.isNavigationBarHidden = true
        setWeatherView()
    }
    
    
    //MARK: gives backEnd data to UI
    func giveDataToUI() {
        
        locationBtn.setTitle(currentWeatherArr.first?.city_name, for: .normal)
        weatherIconnImg.image = UIImage(named: currentWeatherArr[0].icon)
        dateLbl.text = currentWeatherArr[0].date
        temperatureLbl.text = String(describing: currentWeatherArr[0].temp)
        weatherLbl.text = currentWeatherArr[0].weather
        speedOfWindLbl.text = String(describing: currentWeatherArr[0].wind_spd)
        persentOfHumLbl.text = String(describing: currentWeatherArr[0].hum)
    }
    
    // setting weather details view
    func setWeatherView() {
        weatherDetailsView.layer.borderColor = UIColor.white.cgColor
        weatherDetailsView.layer.borderWidth = 2
        
        weatherDetailsView.clipsToBounds = true
    }
    
    @IBAction func weatherMoreDetailsTapped(_ sender: UIButton) {
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func selectLocationTapped(_ sender: UIButton) {
    }
    
    @IBAction func bellTapped(_ sender: UIButton) {
    }
    
    
}


extension HomeVC {
    
    func getCurrentWeather() {
        ///gives current time weather for one time only
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "bbccc7d533msh687e664a9307ae6p116828jsnef294b26392e",
            "X-RapidAPI-Host": "weatherbit-v1-mashape.p.rapidapi.com",
        ]
        
        
        let url = "https://weatherbit-v1-mashape.p.rapidapi.com/current"
        
        let param: [String:Any] = [
            "lat": 41.2995,
            "lon": 69.2401,
            "units": "metric",
            "lang": "uz",
        ]
        
        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseData { [self] response in
            switch response.result {
            case.success(let data):
                let jsonData = JSON(data)
                if let subData = jsonData["data"].array {
                    let wAr = subData.map { WeatherDM(json: $0) }
                    self.currentWeatherArr = wAr
                    if !currentWeatherArr.isEmpty {
                        self.giveDataToUI()
                    }
                    print("wAr ", wAr)
                    print("currentWeatherArr ", currentWeatherArr)
                }
                //                print("data = ", jsonData)
            case.failure(let error):
                let errorData = error.localizedDescription
                print("error = ", errorData)
                
            }
        }
    }
}
