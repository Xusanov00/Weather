//
//  LaunchVC.swift
//  Weather
//
//  Created by Ali on 26/12/22.
//

import UIKit
import Lottie
import SnapKit

class LaunchVC: UIViewController {
    private var animationView: LottieAnimationView!
    
    @IBOutlet weak var lottieView: UIView!
    @IBOutlet weak var umbrellaView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAnimationView(lottie: "75627-thunderstorms-day-overcast-rain", view: lottieView)
        setUpAnimationView(lottie: "128633-umbrella-lottie-animation.json", view: umbrellaView)
    }
    

    
    
    func setUpAnimationView(lottie: String, view: UIView) {
        animationView = .init(name: lottie)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        view.addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        animationView.play()
//        if !animationView.isHidden {
//            UIView.animate(withDuration: 0.1, delay: 0) { [self] in
//                animationView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//                animationView.isHidden = true
//                animationView.stop()
//            }
//
//        }else {
//            UIView.animate(withDuration: 0.1, delay: 0) { [self] in
//                animationView.transform = CGAffineTransform(scaleX: 1, y: 1)
//                animationView.isHidden = false
//                animationView.play()
//            }
//
//        }
    }
}
