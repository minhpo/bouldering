public struct Contacts: Codable {
    let phone: String
    let email: String
    
    public init?(components: [String]) {
        guard components.count == 2 else { return nil }
        
        phone = components[0]
        email = components[1]
    }
}
