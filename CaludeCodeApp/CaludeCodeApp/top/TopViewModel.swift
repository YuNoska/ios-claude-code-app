import SwiftUI
import Observation

@Observable
class TopViewModel {
    var selectedOption: String = "Option 1"
    var showAlert: Bool = false
    var isLoading: Bool = false
    
    let options = ["Option 1", "Option 2", "Option 3"]
    
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