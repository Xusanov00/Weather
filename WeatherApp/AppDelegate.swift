//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Ali on 24/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        let navVC = UINavigationController(rootViewController: vc)
//        let vc = LaunchVC(nibName: "LaunchVC", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navVC
        
        window?.makeKeyAndVisible()
        return true
    }
    
}
