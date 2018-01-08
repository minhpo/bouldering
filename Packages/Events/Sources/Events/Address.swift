public struct Address: CustomStringConvertible, Codable {
    let street: String
    let housenumber: Int
    let postfix: String?
    let postalCode: String
    let city: String
    
    public init?(components: [String]) {
        guard components.count == 5,
            let number = Int(components[1]) else {
                return nil
        }
        
        street = components[0]
        housenumber = number
        postfix = !components[2].isEmpty ? components[2] : nil
        postalCode = components[3]
        city = components[4]
    }
    
    public var description: String {
        let properties: [CustomStringConvertible?] = [street, housenumber, postfix, postalCode, city]
        return properties.flatMap { $0 }
            .map { String(describing: $0) }
            .joined(separator: ", ")
    }
}
