import Foundation

public class GymsRepository {
    
    public class func all() -> [Gym]? {
        guard let content = getRawData() else { return nil }
        
        return convertToModels(content: content)
    }
    
    private class func getRawData() -> String? {
        let fileManager = FileManager.default
        let path = "\(fileManager.currentDirectoryPath)/Resources/gyms.json"
        
        return try? String(contentsOfFile: path)
    }
    
    private class func convertToModels(content: String) -> [Gym]? {
        guard let data = content.data(using: .utf8) else { return nil }
        
        let decoder = JSONDecoder()
        return try? decoder.decode([Gym].self, from: data)
    }
    
}
