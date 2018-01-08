import Foundation

public struct Location: Codable {
    public let city: String
    public let street: String
    public let postalCode: String
    
    public enum CodingKeys: String, CodingKey {
        case city
        case street
        case postalCode = "zip"
    }
}
