public struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
