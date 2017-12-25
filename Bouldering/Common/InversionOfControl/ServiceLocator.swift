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
    
    lazy private(set) var regionMonitor: RegionMonitor = {
        let locations = Set(gymsRepository.getAllGyms().map { $0.coordinates })
        
        let regionMonitor: RegionMonitor = RegionManager(locations: locations)
        return regionMonitor
    }()
    
    lazy private(set) var notificationBroadcaster: NotificationBroadcaster = {
        let broadcaster: NotificationBroadcaster = LocalNotificationBroadcaster()
        return broadcaster
    }()
    
}
