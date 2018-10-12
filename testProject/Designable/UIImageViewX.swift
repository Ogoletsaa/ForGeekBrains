//
//  UIImageViewX.swift
//  003 - Onboarding Page
//
//  Created by Mark Moeykens on 1/5/17.
//  Copyright © 2017 Mark Moeykens. All rights reserved.
//

import UIKit

@IBDesignable
class UIImageViewX: UIImageView {
    
    // MARK: - Properties
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            //layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            //layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            //layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            //layer.shadowOffset.height = shadowOffsetY
        }
    }

    // MARK: - FUNCTIONS
    override func layoutSubviews() {
//        super.layoutSubviews()
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOpacity = Float(shadowOpacity)
//        layer.shadowRadius = shadowRadius
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
    
    
    override func draw(_ rect: CGRect) {
        if clipsToBounds && shadowOpacity > 0 {
            layer.masksToBounds = true
            layer.cornerRadius = cornerRadius
            
            // Outer UIView to hold the Shadow
            let shadow = UIView(frame: rect)
            shadow.layer.cornerRadius = cornerRadius
            shadow.layer.masksToBounds = false
            shadow.layer.shadowOpacity = Float(shadowOpacity)
            shadow.layer.shadowColor = shadowColor.cgColor
            shadow.layer.shadowRadius = shadowRadius
            shadow.layer.shadowOffset.height = shadowOffsetY
            shadow.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            
            shadow.addSubview(self)
        }
    }
    
}
