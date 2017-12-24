//
//  ApplicationInitialiserTests.swift
//  BoulderingTests
//
//  Created by Po Sam on 24/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import XCTest
@testable import Bouldering

class ApplicationInitialiserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocationMonitorDidEnable() {
        let locationMonitor = MockLocationMonitor()
        let serviceLocator = MockServiceLocator(locationMonitor: locationMonitor)
        
        let initialiser = BoulderingInitialiser(serviceLocator: serviceLocator)
        initialiser.start()
        
        XCTAssert(locationMonitor.didEnable, "Expected location monitor to be enabled")
    }
    
    func testLocationMonitorDidStartWhenNotEnabled() {
        let locationMonitor = MockLocationMonitor()
        
        let serviceLocator = MockServiceLocator(locationMonitor: locationMonitor)
        
        let initialiser = BoulderingInitialiser(serviceLocator: serviceLocator)
        initialiser.start()
        
        XCTAssert(locationMonitor.didStart, "Expected location monitor to be started")
    }
    
    func testLocationMonitorDidStartWhenEnabled() {
        let locationMonitor = MockLocationMonitor()
        locationMonitor.mutableEnabledState = true
        
        let serviceLocator = MockServiceLocator(locationMonitor: locationMonitor)
        
        let initialiser = BoulderingInitialiser(serviceLocator: serviceLocator)
        initialiser.start()
        
        XCTAssert(locationMonitor.didStart, "Expected location monitor to be started")
    }
    
    class MockLocationMonitor: LocationMonitor {
        var mutableEnabledState: Bool = false
        var isEnabled: Bool { return mutableEnabledState }
        
        var didEnable = false
        func enable(completion: (() -> Void)?, failure: (() -> Void)?) {
            mutableEnabledState = true
            didEnable = true
            
            completion?()
        }
        
        var didStart = false
        func start() {
            didStart = true
        }
        
        var didStop = false
        func stop() {
            didStop = true
        }
    }
    
    class MockServiceLocator: ServiceLocator {
        
        let mockLocationMonitor: LocationMonitor
        
        init(locationMonitor: LocationMonitor) {
            mockLocationMonitor = locationMonitor
        }
        
        override var locationMonitor: LocationMonitor {
            return mockLocationMonitor
        }
        
    }
}
