import Foundation

public struct GeocodeResultsCollection: Codable {
    
    public let results: [GeocodeResult]
    
}

public struct GeocodeResult: Codable {
    
    public let geometry: GeocodeGeometry
    
}

public struct GeocodeGeometry: Codable {
    
    public let location: GeocodeLocation
    
}

public struct GeocodeLocation: Codable {
    
    public let latitude: Double
    public let longitude: Double
    
    public enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
}

