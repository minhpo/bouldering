import Foundation

// https://developers.facebook.com/tools/explorer/757551344280376?method=GET&path=584954405028266%3Ffields%3Devents&version=v2.11
public class FacebookApiClient {
    
    private let token = "757551344280376|7qkQs5sumhq6kGmWl7PAA1GDW3U"
    
    public init() { }
    
    public func events(for id: String) -> Data? {
        guard let request = request(for: id),
            let data = perform(request: request).data else { return nil }
        
        return data
    }
    
    private func request(for id: String) -> URLRequest? {
        var urlComponents = URLComponents(string: "https://graph.facebook.com")!
        urlComponents.path += "/v2.11/\(id)"
        urlComponents.queryItems = [
            URLQueryItem(name: "fields", value: "events")
        ]
        
        if let url = urlComponents.url {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            return request
        } else {
            return nil
        }
    }
    
    private func perform(request: URLRequest, shouldWait: Bool = true) -> (statusCode: Int, data: Data?) {
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
    
}
