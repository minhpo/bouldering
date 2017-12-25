//
//  RegionMonitor.swift
//  Bouldering
//
//  Created by Po Sam on 24/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation
import CoreLocation

protocol RegionMonitorDelegate: class {
    func enterRegion(coordinates: Coordinates)
    func exitRegion(coordinates: Coordinates)
}

protocol RegionMonitor: LocationService {
    var delegate: RegionMonitorDelegate? { get set }
}

class RegionManager: NSObject, RegionMonitor {
    
    weak var delegate: RegionMonitorDelegate?
    
    private let locations: Set<Coordinates>
    private(set) lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        
        return manager
    }()
    
    init(locations: Set<Coordinates>) {
        self.locations = locations
    }
    
    var isEnabled: Bool {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
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
        
        stop()
        
        let radius: CLLocationDistance = 100
        locations.forEach { coordinates in
            let center = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
            let region = CLCircularRegion(center: center, radius: radius, identifier: coordinates.description)
            
            locationManager.startMonitoring(for: region)
        }
    }
    
    func stop() {
        locationManager.monitoredRegions.forEach { locationManager.stopMonitoring(for: $0) }
    }
    
}

extension RegionManager: CLLocationManagerDelegate {
    
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
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        guard let gymRegion = region as? CLCircularRegion else { return }
        
        let coordinates = getCoordinates(region: gymRegion)
        delegate?.enterRegion(coordinates: coordinates)
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        guard let gymRegion = region as? CLCircularRegion else { return }
        
        let coordinates = getCoordinates(region: gymRegion)
        delegate?.exitRegion(coordinates: coordinates)
    }
    
    private func getCoordinates(region: CLCircularRegion) -> Coordinates {
        let center = region.center
        return Coordinates(latitude: center.latitude, longitude: center.longitude)
    }
}
