//
//  CustomSegue.swift
//  testProject
//
//  Created by Артем Оголец on 21.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit
class CustomSugue: UIStoryboardSegue {
    
    override func perform() {
        guard let  containerView = source.view.superview else { return }
        
        let containerViewFrame = containerView.frame
        let sourceViewTargetFrame = CGRect (x: containerViewFrame.width,
                                            y: 0,
                                            width: source.view.frame.width,
                                            height: source.view.frame.height)
        
        let sourceViewTargetRotate = CGAffineTransform(rotationAngle: 3.14)
        let destinationViewTargetFrame = source.view.frame
        let destinationViewTargetRotate = source.view.transform
        
        containerView.addSubview(destination.view)
        
        
        destination.view.frame = CGRect(x: -containerViewFrame.width,
                                        y: 0,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        destination.view.transform = CGAffineTransform(rotationAngle: -1.57)
        
        UIView.animate      (withDuration: 1,
                       animations: {
                        self.source.view.frame = sourceViewTargetFrame
                        self.source.view.transform = sourceViewTargetRotate
                        self.destination.view.transform = destinationViewTargetRotate
                        self.destination.view.frame = destinationViewTargetFrame
        }) { finished in
                        self.source.present(self.destination,
                                            animated: false,
                                            completion: nil)
        }
    }
}
