import Foundation

public class GymsRepository {
    
    public class func getIds() -> [String]? {
        guard let content = getRawData() else { return nil }
        
        return extractIds(from: content)
    }
    
    private class func getRawData() -> String? {
        let fileManager = FileManager.default
        let path = "\(fileManager.currentDirectoryPath)/Resources/Ids.csv"
        
        return try? String(contentsOfFile: path)
    }
    
    private class func extractIds(from content: String) -> [String] {
        return content.split(separator: "\n")
            .map(String.init)
            .flatMap { $0.split(separator: ",").map(String.init).last }
    }
    
}
