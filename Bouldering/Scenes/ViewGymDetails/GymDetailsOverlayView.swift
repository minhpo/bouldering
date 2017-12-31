//
//  GymDetailsOverlayView.swift
//  Bouldering
//
//  Created by Po Sam on 26/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class GymDetailsOverlayView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupRoundedCorners()
    }
    
    private func setupRoundedCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10))
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        
        self.layer.mask = mask
    }

}
