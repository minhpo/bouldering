//
//  GymPoiView.swift
//  Bouldering
//
//  Created by Po Sam on 25/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit
import MapKit

class GymPoiView: MKAnnotationView {
    
    override func awakeFromNib() {
        centerOffset = CGPoint(x: 0, y: -bounds.midY)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(annotation: GymPoiAnnotation) {
        self.annotation = annotation
        nameLabel.text = annotation.title
    }

}
