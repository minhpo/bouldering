//
//  Coordinates.swift
//  Bouldering
//
//  Created by Po Sam on 23/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

struct Coordinates: CustomStringConvertible, Codable {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var description: String {
        return "(\(latitude), \(longitude))"
    }
}

extension Coordinates: Hashable {
    
    var hashValue: Int {
        return description.hashValue
    }
    
    static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
        return lhs.description == rhs.description
    }
}
