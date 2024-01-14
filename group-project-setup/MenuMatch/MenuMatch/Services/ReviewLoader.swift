import Foundation

class ReviewLoader: ObservableObject {
    let apiClient: RestaurantAPI
    @Published private(set) var state: LoadingState = .idle
    
    enum LoadingState {
        case idle
        case loading
        case success(data: ReviewResponse)
        case failed(error: Error)
    }
    
    init(apiClient: RestaurantAPI) {
        self.apiClient = apiClient
    }
    
    @MainActor
    func loadReviews(restaurantIdName: String) async {
        self.state = .loading
        self.state = .loading
        do {
            let response = try await apiClient.fetchReviews(restaurantIdName: restaurantIdName)
            self.state = .success(data: response)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
