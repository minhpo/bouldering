//
//  ServiceLocator.swift
//  Bouldering
//
//  Created by Po Sam on 23/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

class ServiceLocator {
    
    static let `default`: ServiceLocator = ServiceLocator()
    
    lazy private(set) var gymsRepository: GymsRepository = {
        let repository: GymsRepository = GymsFileRepository()
        return repository
    }()
    
    lazy private(set) var locationMonitor: LocationMonitor = {
        let locationMonitor: LocationMonitor = LocationManager()
        return locationMonitor
    }()
    
}
