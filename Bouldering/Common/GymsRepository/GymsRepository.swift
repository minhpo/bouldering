//
//  GymsRepository.swift
//  Bouldering
//
//  Created by Po Sam on 23/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation

protocol GymsRepository {
    func getAllGyms() -> [Gym]
}

class GymsFileRepository: GymsRepository {
    
    func getAllGyms() -> [Gym] {
        guard let content = getContentFromFile(),
            let gyms = convertToModels(content: content) else {
                assert(false, "Failed importing gyms data")
                return []
        }
        
        return gyms
    }
    
    private func getContentFromFile() -> String? {
        guard let path = Bundle.main.path(forResource: "gyms", ofType: "json") else { return nil }
        
        return try? String(contentsOfFile: path)
    }
    
    private func convertToModels(content: String) -> [Gym]? {
        guard let data = content.data(using: .utf8) else { return nil }
        
        let decoder = JSONDecoder()
        return try? decoder.decode([Gym].self, from: data)
    }
    
}
