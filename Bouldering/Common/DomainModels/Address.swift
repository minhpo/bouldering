//
//  Address.swift
//  Bouldering
//
//  Created by Po Sam on 26/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

struct Address: Codable {
    
    let street: String
    let housenumber: Int
    let postfix: String?
    let postalCode: String
    let city: String
    
}
