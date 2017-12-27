//
//  UIView+Layer.swift
//  Bouldering
//
//  Created by Po Sam on 25/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return self.layer.shadowColor != nil ? UIColor(cgColor: self.layer.shadowColor!) : nil
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowHorizontalOffset: CGFloat {
        get {
            return self.layer.shadowOffset.width
        }
        set {
            let shadowOffsetHeight = self.layer.shadowOffset.height
            self.layer.shadowOffset = CGSize(width: newValue, height: shadowOffsetHeight)
        }
    }
    
    @IBInspectable var shadowVerticicalOffset: CGFloat {
        get {
            return self.layer.shadowOffset.height
        }
        set {
            let shadowOffsetWidth = self.layer.shadowOffset.width
            self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: newValue)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
}
