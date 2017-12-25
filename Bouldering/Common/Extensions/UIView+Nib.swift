//
//  UIView+Nib.swift
//  Bouldering
//
//  Created by Po Sam on 25/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

extension UIView {
    
    class func newInstance() -> Self {
        return loadFromNib()
    }
    
    fileprivate class func loadFromNib<T>(_ bundle: Bundle? = nil) -> T {
        guard let nib = UINib(nibName: String(describing: self), bundle: bundle)
            .instantiate(withOwner: nil, options: nil)[0] as? T else {
                fatalError()
        }
        
        return nib
    }
    
}
