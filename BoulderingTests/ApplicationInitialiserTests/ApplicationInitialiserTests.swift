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
        let mock = MockMonitor()
        let serviceLocator = MockServiceLocator(mock: mock)
        let initialiser = BoulderingInitialiser(serviceLocator: serviceLocator)
        
        initialiser.start()
        
        XCTAssert(mock.didEnable, "Expected region monitor to be enabled")
    }
    
    func testLocationMonitorDidStartWhenNotEnabled() {
        let mock = MockMonitor()
        let serviceLocator = MockServiceLocator(mock: mock)
        let initialiser = BoulderingInitialiser(serviceLocator: serviceLocator)
        
        initialiser.start()
        
        XCTAssert(mock.didStart, "Expected region monitor to be started")
    }
    
    func testLocationMonitorDidStartWhenEnabled() {
        let mock = MockMonitor()
        let serviceLocator = MockServiceLocator(mock: mock)
        let initialiser = BoulderingInitialiser(serviceLocator: serviceLocator)
        
        mock.mutableEnabledState = true
        initialiser.start()
        
        XCTAssert(mock.didStart, "Expected region monitor to be started")
    }
    
    class MockMonitor: RegionMonitor {
        weak var delegate: RegionMonitorDelegate?
        
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
        
        let mock: RegionMonitor
        
        init(mock: RegionMonitor) {
            self.mock = mock
        }
        
        override var regionMonitor: RegionMonitor {
            return mock
        }
        
    }
}
