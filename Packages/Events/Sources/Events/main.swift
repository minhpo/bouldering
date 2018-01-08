import Foundation

let gymIds = GymsRepository.getIds() ?? []

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
    
    let relevantEvents = decodedEvents.filter { gymIds.contains($0.place?.id ?? "") && $0.start >= date }
    events.append(contentsOf: relevantEvents)
}

events.sort(by: { $0.start > $1.start })
EventsRepository.export(events: events)
