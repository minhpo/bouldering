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
        DispatchQueue.global(qos: .utility).async {
            self.startRegionMonitoring()
        }
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
        let monitor = serviceLocator.regionMonitor
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
}
