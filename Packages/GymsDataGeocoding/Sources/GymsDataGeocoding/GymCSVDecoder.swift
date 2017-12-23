class GymCSVDecoder {

    class func decode(content: String) -> [Gym] {
        return content.split(separator: "\n")
            .flatMap { decodeRow(string: String($0)) }
    }
    
    private class func decodeRow(string: String) -> Gym? {
        let components: [String] = string.split(separator: ",", omittingEmptySubsequences: false).map(String.init)
        
        return Gym(components: components)
    }
    
}
