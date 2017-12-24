import Foundation

public class GeocodeJSONDecoder {
    
    public class func decode(data: Data) -> GeocodeResultsCollection? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(GeocodeResultsCollection.self, from: data)
        } catch {
            return nil
        }
    }
    
}
