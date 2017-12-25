//
//  ViewGymsOnMapInteractor.swift
//  Bouldering
//
//  Created by Po Sam on 23/12/2017.
//  Copyright (c) 2017 Mobairu. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ViewGymsOnMapBusinessLogic {
    func start()
}

protocol ViewGymsOnMapDataStore {
}

class ViewGymsOnMapInteractor: ViewGymsOnMapBusinessLogic, ViewGymsOnMapDataStore {
    
    var presenter: ViewGymsOnMapPresentationLogic?
    
    let gymsRepository: GymsRepository
    
    init(gymsRepository: GymsRepository) {
        self.gymsRepository = gymsRepository
    }
    
    // MARK: Do something
    
    func start() {
        DispatchQueue.global(qos: .userInitiated).async {
            let gyms = self.gymsRepository.getAllGyms()
            self.presenter?.display(gyms: gyms)
        }
    }
}