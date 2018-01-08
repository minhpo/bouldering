import Foundation

public struct Event: Codable {
    
    public let name: String
    public let place: Place
    public let description: String?
    public let start: Date
    public let end: Date?
    
}
