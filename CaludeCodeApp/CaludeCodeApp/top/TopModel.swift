import Foundation

struct ApiResponse {
    let success: Bool
    let message: String
}

class ApiService {
    static func callFirstApi() async -> ApiResponse {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return ApiResponse(success: true, message: "First API called successfully")
    }
    
    static func callSecondApi() async -> ApiResponse {
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        return ApiResponse(success: true, message: "Second API called successfully")
    }
}