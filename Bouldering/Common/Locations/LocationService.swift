//
//  LocationService.swift
//  Bouldering
//
//  Created by Po Sam on 24/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

protocol LocationService {
    var isEnabled: Bool { get }
    
    func enable(completion: (() -> Void)?, failure: (() -> Void)?)
    func start()
    func stop()
}
