public struct Gym: CustomStringConvertible, Codable {
    
    let id: Int
    let name: String
    let address: Address
    let contacts: Contacts
    let openingHours: OpeningHoursCollection
    var coordinates: Coordinates?
    
    public init?(components: [String]) {
        guard components.count == 24,
            let id = Int(components[0]),
            let address = Address(components: Array(components[2...6])),
            let contacts = Contacts(components: Array(components[7...9])),
            let openingHours = OpeningHoursCollection(components: Array(components[10...23])) else {
                return nil
        }
        
        self.id = id
        name = components[1]
        self.address = address
        self.contacts = contacts
        self.openingHours = openingHours
        
        coordinates = nil
    }
    
    public var description: String {
        var formattedString = "\(name), \(address)"
        
        if let coordinates = coordinates {
            formattedString = "\(formattedString) - (\(coordinates.latitude), \(coordinates.longitude))"
        }
        
        return formattedString
    }
    
}

extension Gym {
    
    public mutating func update(coordinates: Coordinates) {
        self.coordinates = coordinates
    }
    
}
