public struct OpeningHours: Codable {
    let opensAt: String
    let closesAt: String
    
    public init?(components: [String]) {
        guard components.count == 2 else { return nil }
        
        opensAt = components[0]
        closesAt = components[1]
    }
}
