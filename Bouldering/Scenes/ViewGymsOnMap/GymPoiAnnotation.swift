//
//  GymPoiAnnotation.swift
//  Bouldering
//
//  Created by Po Sam on 23/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import MapKit

class GymPoiAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
