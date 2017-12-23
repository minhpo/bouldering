import Foundation

public class GymJSONEncoder {
    
    public class func encode(gyms: [Gym]) -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let jsonData = try? encoder.encode(gyms),
            let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        
        return nil
    }
    
}
