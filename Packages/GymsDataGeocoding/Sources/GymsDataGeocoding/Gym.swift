public struct Gym: CustomStringConvertible, Codable {
    
    let name: String
    let address: Address
    let contacts: Contacts
    var coordinates: Coordinates?
    
    public init?(components: [String]) {
        guard components.count >= 8,
            let address = Address(components: Array(components[1...5])),
            let contacts = Contacts(components: Array(components[6...7])) else {
                return nil
        }
        
        name = components[0]
        self.address = address
        self.contacts = contacts
        
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
