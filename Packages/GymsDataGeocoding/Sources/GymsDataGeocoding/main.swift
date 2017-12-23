// 1. Get all gyms
let gyms = GymRepository.getAllGymsFromSource()

// 2. Retrieve lat/lng for each gym
var geocodedGyms = gyms
let geocoder = Geocoder()
gyms.enumerated().forEach { index, gym in
    guard let coordinates = geocoder.geocode(gym: gym) else { return }

    // 3. Append lat/lng to corresponding gym
    geocodedGyms[index].update(coordinates: coordinates)
}

// 4. Save new data
GymRepository.export(gyms: geocodedGyms)
