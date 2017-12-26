public struct OpeningHoursCollection: Codable {
    let monday: OpeningHours
    let tuesday: OpeningHours
    let wednesday: OpeningHours
    let thursday: OpeningHours
    let friday: OpeningHours
    let saturday: OpeningHours
    let sunday: OpeningHours
    
    public init?(components: [String]) {
        guard components.count == 14,
            let monday = OpeningHours(components: Array(components[0...1])),
            let tuesday = OpeningHours(components: Array(components[2...3])),
            let wednesday = OpeningHours(components: Array(components[4...5])),
            let thursday = OpeningHours(components: Array(components[6...7])),
            let friday = OpeningHours(components: Array(components[8...9])),
            let saturday = OpeningHours(components: Array(components[10...11])),
            let sunday = OpeningHours(components: Array(components[12...13])) else { return nil }
        
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}
