import Foundation

public class EventsFactory {
    
    public class func makeEvent(from source: FacebookEvent, at gym: Gym) -> Event? {
        guard let coordinates = gym.coordinates else { return nil }
        
        let place = Place(name: gym.name, address: gym.address, coordinates: coordinates)
        
        return Event(name: source.name, place: place, description: source.description, start: source.start, end: source.end)
    }
    
}
