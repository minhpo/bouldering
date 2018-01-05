//
//  ApplicationInitialiser.swift
//  Bouldering
//
//  Created by Po Sam on 24/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

protocol ApplicationInitialiser {
    func start()
}

class BoulderingInitialiser: ApplicationInitialiser {
    
    let serviceLocator: ServiceLocator
    
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
    }
    
    func start() {
        self.startRegionMonitoring()
        self.registerForNotifications()
    }
    
    private func startLocationMonitoring() {
        let locationMonitor = serviceLocator.locationMonitor
        if locationMonitor.isEnabled {
            locationMonitor.start()
        } else {
            locationMonitor.enable(completion: {
                locationMonitor.start()
            }, failure: nil)
        }
    }
    
    private func startRegionMonitoring() {
        var monitor = serviceLocator.regionMonitor
        
        // TODO: This is only temporary, should be removed
        monitor.delegate = self
        if monitor.isEnabled {
            monitor.start()
        } else {
            let group = DispatchGroup()
            group.enter()
            monitor.enable(completion: {
                monitor.start()
                group.leave()
            }, failure: {
                group.leave()
            })
        }
    }
    
    private func registerForNotifications() {
        let broadcaster = serviceLocator.notificationBroadcaster
        if !broadcaster.isEnabled {
            broadcaster.enable(completion: nil, failure: nil)
        }
    }
    
}

extension BoulderingInitialiser: RegionMonitorDelegate {
    
    func enterRegion(coordinates: Coordinates) {
        let repository = serviceLocator.gymsRepository
        let broadcaster = serviceLocator.notificationBroadcaster
        
        if let gym = repository.getGym(at: coordinates) {
            let title = NSLocalizedString("geofence_entry_title", comment: "")
            let bodyTemplate = NSLocalizedString("geofence_entry_message_template", comment: "")
            let body = String(format: bodyTemplate, gym.name)
            broadcaster.broadcast(title: title, body: body, after: 1)
        }
    }
    
    func exitRegion(coordinates: Coordinates) {
        let repository = serviceLocator.gymsRepository
        let broadcaster = serviceLocator.notificationBroadcaster
        
        if let gym = repository.getGym(at: coordinates) {
            let title = NSLocalizedString("geofence_exit_title", comment: "")
            let bodyTemplate = NSLocalizedString("geofence_exit_message_template", comment: "")
            let body = String(format: bodyTemplate, gym.name)
            broadcaster.broadcast(title: title, body: body, after: 1)
        }
    }
    
}
