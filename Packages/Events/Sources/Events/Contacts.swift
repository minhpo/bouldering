public struct Contacts: Codable {
    let phone: String
    let email: String
    let website: String
    
    public init?(components: [String]) {
        guard components.count == 3 else { return nil }
        
        phone = components[0]
        email = components[1]
        website = components[2]
    }
}
