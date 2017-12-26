//
//  OpeningHoursCollection.swift
//  Bouldering
//
//  Created by Po Sam on 26/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

struct OpeningHoursCollection: Codable {
    
    let monday: OpeningHours
    let tuesday: OpeningHours
    let wednesday: OpeningHours
    let thursday: OpeningHours
    let friday: OpeningHours
    let saturday: OpeningHours
    let sunday: OpeningHours
    
}
