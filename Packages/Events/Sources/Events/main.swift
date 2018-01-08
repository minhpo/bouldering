import Foundation

let gyms = GymsRepository.all() ?? []
let gymIds = gyms.map { $0.id }

var gymsLookupTable: [String: Gym] = [:]
zip(gymIds, gyms).forEach { id, gym in
    gymsLookupTable["\(id)"] = gym
}

let apiClient = FacebookApiClient()
let decoder = FacebookJSONDecoder()

// Determine cut off date
var components = DateComponents()
components.year = Calendar.current.component(.year, from: Date()) - 1 // Get previous year
let date = Calendar.current.date(from: components) ?? Date()

var events: [Event] = []
gymIds.forEach { id in
    guard let data = apiClient.events(for: id),
        let decodedEvents = decoder.decode(data: data) else { return }
    
    decodedEvents.forEach { facebookEvent in
        guard facebookEvent.start >= date,
            let gym = gymsLookupTable[facebookEvent.place?.id ?? ""],
            let event = EventsFactory.makeEvent(from: facebookEvent, at: gym) else { return }
        
        events.append(event)
    }
}

events.sort(by: { $0.start > $1.start })
EventsRepository.export(events: events)
