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
        startLocationMonitoring()
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
    
}
