import SwiftUI
import Observation

@Observable
class TopViewModel {
    var selectedOption: String = "Italian"
    var showAlert: Bool = false
    var isLoading: Bool = false
    
    let options = ["Italian", "Chinese", "Indian", "American"]
    
    func callApis() async -> Void {
        isLoading = true
        
        let firstResponse = await ApiService.callFirstApi()
        print("First API: \(firstResponse.message)")
        
        let secondResponse = await ApiService.callSecondApi()
        print("Second API: \(secondResponse.message)")
        
        isLoading = false
        showAlert = true
    }
}