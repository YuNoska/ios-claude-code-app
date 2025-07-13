import SwiftUI
import Observation

@Observable
class LoginViewModel {
    var userId: String = ""
    var password: String = ""
    var isLoggedIn: Bool = false
    
    func login() -> Void {
        isLoggedIn = true
    }
}