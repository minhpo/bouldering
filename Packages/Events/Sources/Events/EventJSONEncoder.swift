import Foundation

public class EventJSONEncoder {
    
    public class func encode(events: [Event]) -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if #available(macOS 10.12, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        
        if let jsonData = try? encoder.encode(events),
            let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        
        return nil
    }
    
}
