public struct Gym: CustomStringConvertible, Codable {
    
    let name: String
    let address: Address
    let contacts: Contacts
    let openingHours: OpeningHoursCollection
    var coordinates: Coordinates?
    
    public init?(components: [String]) {
        guard components.count >= 22,
            let address = Address(components: Array(components[1...5])),
            let contacts = Contacts(components: Array(components[6...7])),
            let openingHours = OpeningHoursCollection(components: Array(components[8...21])) else {
                return nil
        }
        
        name = components[0]
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
