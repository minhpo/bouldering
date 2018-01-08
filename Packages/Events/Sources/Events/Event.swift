import Foundation

public struct Event: Codable {
    public let name: String
    public let description: String?
    public let start: Date
    public let end: Date?
    public let place: Place?
    
    public enum CodingKeys: String, CodingKey {
        case name
        case description
        case start = "start_time"
        case end = "end_time"
        case place
    }
}
