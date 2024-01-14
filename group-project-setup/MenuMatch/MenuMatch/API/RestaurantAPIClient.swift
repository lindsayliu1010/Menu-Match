import CoreLocation
protocol RestaurantAPI {
    func fetchRestaurants(coordinate: Coordinate) async throws -> RestaurantResponse
    func fetchReviews(restaurantIdName: String) async throws -> ReviewResponse
}

struct RestaurantAPIClient: RestaurantAPI, APIClient {
    let session: URLSession = .shared
    
    func fetchRestaurants(coordinate: Coordinate) async throws -> RestaurantResponse {
        let path = RestaurantEndpoint.path(queryType: .restaurants(coordinate: coordinate))
        dump(path)

        let response: RestaurantResponse = try await performRequest(url: path)

        return response
    }
    
    func fetchReviews(restaurantIdName: String) async throws -> ReviewResponse {
        let path = RestaurantEndpoint.path(queryType: .reviews(restaurantIdName: restaurantIdName))
        dump(path)
        let response: ReviewResponse = try await performRequest(url: path)
        return response
    }
}

struct MockRestaurantAPIClient: RestaurantAPI {
    func fetchRestaurants(coordinate: Coordinate) async throws -> RestaurantResponse {
        RestaurantResponse.mock()
    }
    
    func fetchReviews(restaurantIdName: String) async throws -> ReviewResponse {
        ReviewResponse.mock()
    }
}
