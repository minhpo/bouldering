import Foundation

class GymRepository {
    
    class func getAllGymsFromSource() -> [Gym] {
        guard let rawData = getRawData() else { return [] }
        
        return GymCSVDecoder.decode(content: rawData)
    }
    
    private class func getRawData() -> String? {
        let fileManager = FileManager.default
        let path = "\(fileManager.currentDirectoryPath)/Resources/Gyms.csv"
        
        return try? String(contentsOfFile: path)
    }
    
    class func export(gyms: [Gym]) {
        guard let jsonString = GymJSONEncoder.encode(gyms: gyms) else { return }
        
        let fileManager = FileManager.default
        let path = "\(fileManager.currentDirectoryPath)/Output/gyms.json"
        
        do {
            try jsonString.write(toFile: path, atomically: false, encoding: .utf8)
        } catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
    }
}
