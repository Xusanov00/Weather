//
//  DetailVC.swift
//  WeatherApp
//
//  Created by Ali on 24/11/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class DetailVC: UIViewController {
    
    @IBOutlet weak var weatherTimeCollView: UICollectionView!
    
    var weatherTimeArr: [WeatherTimeDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDairlyWeather()
        weatherTimeCollView.delegate = self
        weatherTimeCollView.dataSource = self
        weatherTimeCollView.register(TimelyWeatherCVC.nib(), forCellWithReuseIdentifier: TimelyWeatherCVC.id)
    }
    
    
    
    @IBAction func backTapped(_ sender: Any) {
        ///back button
        navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if weatherTimeArr.count >= 5 {
            return weatherTimeArr.count
//        }else {
//            return 5
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weatherTimeCollView.dequeueReusableCell(withReuseIdentifier: TimelyWeatherCVC.id, for: indexPath) as? TimelyWeatherCVC else { return UICollectionViewCell() }
        
        cell.updateCell(cell: weatherTimeArr[indexPath.row])
//        weatherTimeCollView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width-50)/5
        return CGSize(width: width, height: 120)
    }
    
    
}


extension DetailVC {

    func getDairlyWeather() {
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "bbccc7d533msh687e664a9307ae6p116828jsnef294b26392e",
                "X-RapidAPI-Host": "weatherbit-v1-mashape.p.rapidapi.com"
        ]
        
        
        let url = "https://weatherbit-v1-mashape.p.rapidapi.com/forecast/daily"
        
        let param: [String:Any] = [
            "lat": 41.2995,
            "lon": 69.2401,
            "units": "metric",
            "lang": "ar",
        ]
        
        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case.success(let data):
                let jsonData = JSON(data)
                print("jsssss = ",jsonData)
                if let subData = jsonData["data"].array {
                    let wArr = subData.map { WeatherTimeDM(json: $0) }
                    self.weatherTimeArr = wArr
                    
                    print("==========",wArr.count)
                    for i in wArr {
                        print("-------------",i)
                    }
                    self.weatherTimeCollView.reloadData()
                }
//                print("data = ", jsonData)
            case.failure(let error):
                let errorData = error.localizedDescription
                print("error = ", errorData)
                
            }
        }
    }
    
}
