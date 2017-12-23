//
//  GymsRepositoryTests.swift
//  BoulderingTests
//
//  Created by Po Sam on 23/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import XCTest
@testable import Bouldering

class GymsRepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testImportingGyms() {
        let repository = GymsFileRepository()
        
        self.measure {
            let gyms = repository.getAllGyms()
            
            let expectedCount = 20
            XCTAssert(gyms.count == expectedCount, "Expected \(expectedCount) gyms, but got back \(gyms.count)")
        }
    }
    
}
