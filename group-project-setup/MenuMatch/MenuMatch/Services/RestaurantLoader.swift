import Foundation

class RestaurantLoader: ObservableObject {
    let apiClient: RestaurantAPI
    @Published private(set) var state: LoadingState = .idle

    enum LoadingState {
        case idle
        case loading
        case success(data: RestaurantResponse)
        case failed(error: Error)
    }

    init(apiClient: RestaurantAPI) {
        self.apiClient = apiClient
    }

    @MainActor
    func loadRestaurants(coordinate: Coordinate) async {
        self.state = .loading
        self.state = .loading
        do {
            let response = try await apiClient.fetchRestaurants(coordinate: coordinate)
            self.state = .success(data: response)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
