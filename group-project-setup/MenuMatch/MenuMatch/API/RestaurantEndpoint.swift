import Foundation
import CoreLocation


struct RestaurantEndpoint {
    static let baseUrl = "https://api.yelp.com/v3/businesses/"

    enum QueryType {
        case restaurants(coordinate: Coordinate)
        case reviews(restaurantIdName: String)
    }
    
    static func path(queryType: QueryType) -> String {
        let url = "\(baseUrl)"
        let searchTerm = "search?term=restaurants"
        let reviewTerm = "/reviews"
        let queryParameters: String
        
        switch queryType {
        case .restaurants(let coordinate): queryParameters = "\(searchTerm)&latitude=\(coordinate.latitude)&longitude=\(coordinate.longitude)"
        case .reviews(let restaurantIdName): queryParameters = "\(restaurantIdName)\(reviewTerm)"
        }
    
        return "\(url)\(queryParameters)"
    }
}
