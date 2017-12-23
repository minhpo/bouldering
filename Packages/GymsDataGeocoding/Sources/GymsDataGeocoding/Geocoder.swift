import Foundation

public class Geocoder {
    
    public init() { }
    
    public func geocode(gym: Gym) -> Coordinates? {
        guard let request = getGeocodeRequest(for: gym),
            let data = performRequest(request: request).data,
            let coordinates = extractCoordinates(from: data) else { return nil }
        
        return coordinates
    }
    
    private func getGeocodeRequest(for gym: Gym) -> URLRequest? {
        let key = "AIzaSyB1Vt_mcdGFSBpHOSEvGa4q451ZurJV5zE"
        let address = gym.description
        
        var urlComponents = URLComponents(string: "https://maps.googleapis.com")!
        urlComponents.path += "/maps/api/geocode/json"
        urlComponents.queryItems = [
            URLQueryItem(name: "address", value: address),
            URLQueryItem(name: "key", value: key)
        ]
        
        if let url = urlComponents.url {
            return URLRequest(url: url)
        } else {
            return nil
        }
    }
    
    private func performRequest(request: URLRequest, shouldWait: Bool = true) -> (statusCode: Int, data: Data?) {
        var response: (statusCode: Int, data: Data?) = (statusCode: 500, data: nil)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let asyncProcesGroup = DispatchGroup()
        asyncProcesGroup.enter()
        session.dataTask(with: request, completionHandler: { data, urlResponse, _ in
            defer {
                asyncProcesGroup.leave()
            }
            
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode ?? 500
            response = (statusCode: statusCode, data: data)
        }).resume()
        
        let timeout = DispatchTime.now() + Double(Int64(UInt64(10) * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
        
        if shouldWait {
            _ = asyncProcesGroup.wait(timeout: timeout)
        }
        
        return response
    }
    
    private func extractCoordinates(from data: Data) -> Coordinates? {
        guard let resultsCollection = GeocodeJSONDecoder.decode(data: data),
            let result = resultsCollection.results.first else {
                return nil
        }
        
        return Coordinates(latitude: result.geometry.location.latitude, longitude: result.geometry.location.longitude)
    }
    
}

