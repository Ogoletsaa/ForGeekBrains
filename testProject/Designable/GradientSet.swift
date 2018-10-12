//
//  GradientSet..swift
//  testProject
//
//  Created by Артем Оголец on 03.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func setGradientLayer(colorOne:UIColor, colorTwo:UIColor, colorThree:UIColor, colorFour:UIColor,colorFive:UIColor) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor,colorThree.cgColor,colorFour.cgColor,colorFive.cgColor]
        gradientLayer.locations = [0.0,0.2,0.4,0.6,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)

    }
}
