//
//  Gym.swift
//  Bouldering
//
//  Created by Po Sam on 23/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

struct Gym: Codable {
    
    let name: String
    let address: String
    let housenumber: Int
    let postfix: String?
    let postalCode: String
    let city: String
    var coordinates: Coordinates
    
}
