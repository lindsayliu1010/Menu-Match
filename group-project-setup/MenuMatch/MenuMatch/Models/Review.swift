import Foundation
import CoreLocation

public struct ReviewResponse: Decodable, Hashable {
    var reviews: [Review]
    
    private enum CodingKeys: String, CodingKey {
       case reviews
    }
    
    static func mock() -> ReviewResponse {
        ReviewResponse(reviews: [Review(url: "https://www.yelp.com/biz/north-india-restaurant-san-francisco?hrid=AeVAkQgueu6JtYtU4r3Jrg", review: "This place is really pretty and I really love this place. My friends and me came here yesterday. The food is superb, the service is impeccable (mostly) and...", user: User(imageUrl: "", name: "Hoang V."), rating: 5), Review(url: "https://www.yelp.com/biz/north-india-restaurant-san-francisco?hrid=6tsz9tl7HAiOcYj_fGrsCg", review: "Went there for the first time Saturday Evening,everything is great, the ambiance is outstanding for this location, tried the mulliatawny soup for starters...", user: User(imageUrl: "http://s3-media2.fl.yelpcdn.com/photo/O1ZuPKBhwxHAT60XZksWHQ/o.jpg", name: "Winston P."), rating: 5), Review(url: "https://www.yelp.com/biz/north-india-restaurant-san-francisco?hrid=3b3-zDKfomV-1qR3Z0jmQw", review: "I came in here for the $9.95 lunch buffet the day after it opened.  It is the old Tara space and I like how it has been opened up to accommodate many more...", user: User(imageUrl: "http://s3-media1.fl.yelpcdn.com/photo/bQRonQWaxInb7eKAtMjf3A/o.jpg", name: "Ronita J."), rating: 4)])
    }
}

extension ReviewResponse {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reviews = try container.decode([Review].self, forKey: .reviews)
    }
}

public struct Review: Identifiable, Decodable, Hashable {
    var url: String
    var review: String
    var user: User
    var rating: Double
    
    public var id: String {
        return url
    }
    
    private enum CodingKeys: String, CodingKey {
        case url
        case review = "text"
        case user
        case rating 
    }
}

extension Review {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.url = try values.decode(String.self, forKey: .url)
        self.review = try values.decode(String.self, forKey: .review)
        self.user = try values.decode(User.self, forKey: .user)
        self.rating = try values.decode(Double.self, forKey: .rating)
    }
}

public struct User: Decodable, Hashable {
    var imageUrl: String?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case name
    }
}
