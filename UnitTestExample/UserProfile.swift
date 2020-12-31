struct UserProfile {
    var name: String?
    var email: String?
    
    func validate() -> Bool {
        guard let name = name else {
            return false
        }
        
        guard name.count != 0 else {
            return false
        }
        
        return true
    }
}
