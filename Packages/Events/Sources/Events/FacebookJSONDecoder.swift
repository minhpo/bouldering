import Foundation

public class FacebookJSONDecoder {
    
    public init() { }
    
    public func decode(data: Data) -> [Event]? {
        do {
            guard let raw = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let eventsData = extractEventsData(json: raw) else { return nil }
            
            let decoder = JSONDecoder()
            if #available(macOS 10.12, *) {
                decoder.dateDecodingStrategy = .iso8601
            }
            
            return try decoder.decode([Event].self, from: eventsData)
        } catch {
            return nil
        }
    }
    
    private func extractEventsData(json: [String: Any]) -> Data? {
        guard let events = json["events"] as? [String: Any],
            let data = events["data"] as? [Any] else { return nil }
        
        do {
            return try JSONSerialization.data(withJSONObject: data, options: [])
        } catch {
            return nil
        }
    }
    
}
