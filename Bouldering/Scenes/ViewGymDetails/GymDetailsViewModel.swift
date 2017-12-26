//
//  GymDetailsViewModel.swift
//  Bouldering
//
//  Created by Po Sam on 26/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

struct GymDetailsViewModel {
    
    let name: String
    let topAddress: String
    let bottomAddress: String
    let openingHours: [WeekDay: String]
    
    init(gym: Gym) {
        
        name = gym.name
        if let postfix = gym.address.postfix {
            topAddress = "\(gym.address.street) \(gym.address.housenumber) - \(postfix)"
        } else {
            topAddress = "\(gym.address.street) \(gym.address.housenumber)"
        }
        
        bottomAddress = "\(gym.address.postalCode) \(gym.address.city)"
        
        openingHours = [
            .monday: "\(gym.openingHours.monday.opensAt) - \(gym.openingHours.monday.closesAt)",
            .tuesday: "\(gym.openingHours.tuesday.opensAt) - \(gym.openingHours.tuesday.closesAt)",
            .wednesday: "\(gym.openingHours.wednesday.opensAt) - \(gym.openingHours.wednesday.closesAt)",
            .thursday: "\(gym.openingHours.thursday.opensAt) - \(gym.openingHours.thursday.closesAt)",
            .friday: "\(gym.openingHours.friday.opensAt) - \(gym.openingHours.friday.closesAt)",
            .saturday: "\(gym.openingHours.saturday.opensAt) - \(gym.openingHours.saturday.closesAt)",
            .sunday: "\(gym.openingHours.sunday.opensAt) - \(gym.openingHours.sunday.closesAt)"
        ]
    }
    
}
