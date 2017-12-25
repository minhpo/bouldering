//
//  LocationMonitor.swift
//  Bouldering
//
//  Created by Po Sam on 24/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationMonitor: LocationService { }

class LocationManager: NSObject, LocationMonitor {
    
    private(set) lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        
        return manager
    }()
    
    var isEnabled: Bool {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            return true
        default:
            return false
        }
    }
    
    private var enableCompletionCallback: (() -> Void)?
    private var enableFailureCallback: (() -> Void)?
    
    func enable(completion: (() -> Void)?, failure: (() -> Void)?) {
        enableCompletionCallback = completion
        enableFailureCallback = failure
        
        locationManager.requestAlwaysAuthorization()
    }
    
    func start() {
        guard isEnabled else { return }
        
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        defer {
            enableCompletionCallback = nil
            enableFailureCallback = nil
        }
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            enableCompletionCallback?()
        default:
            enableFailureCallback?()
        }
    }
    
}
