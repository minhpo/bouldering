public struct Gym: CustomStringConvertible, Codable {
    
    let name: String
    let address: String
    let housenumber: Int
    let postfix: String?
    let postalCode: String
    let city: String
    var coordinates: Coordinates?
    
    public init?(components: [String]) {
        guard components.count == 6,
            let number = Int(components[2]) else {
                return nil
        }
        
        name = components[0]
        address = components[1]
        housenumber = number
        postfix = !components[3].isEmpty ? components[3] : nil
        postalCode = components[4]
        city = components[5]
        
        coordinates = nil
    }
    
    public var description: String {
        let properties: [CustomStringConvertible?] = [name, address, housenumber, postfix, postalCode, city]
        var formattedString = properties.flatMap { $0 }
            .map { String(describing: $0) }
            .joined(separator: ", ")
        
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
