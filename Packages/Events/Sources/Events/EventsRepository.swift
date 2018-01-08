import Foundation

public class EventsRepository {
    
    public class func export(events: [Event]) {
        guard let jsonString = EventJSONEncoder.encode(events: events) else { return }
        
        let fileManager = FileManager.default
        let path = "\(fileManager.currentDirectoryPath)/Output/events.json"
        
        do {
            try jsonString.write(toFile: path, atomically: false, encoding: .utf8)
        } catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }

    }
    
}
