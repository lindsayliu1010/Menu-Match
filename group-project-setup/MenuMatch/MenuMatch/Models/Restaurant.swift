import Foundation
import SwiftUI
import CoreLocation

public struct RestaurantResponse: Decodable, Hashable {
    var totalResults: Int
    var restaurants: [Restaurant]
    
    private enum CodingKeys: String, CodingKey {
        case totalResults = "total"
        case restaurants = "businesses"
    }
    
    static func mock() -> RestaurantResponse {
        RestaurantResponse(totalResults: 1316, restaurants: [Restaurant(rating: 4.5, price: "$$", phoneNumber: "+14154212337", idName: "molinari-delicatessen-san-francisco", categories: [RestaurantCategory(alias: "delis", title: "Delis")], reviewCount: 910, name: "Molinari Delicatessen", url: "https://www.yelp.com/biz/molinari-delicatessen-san-francisco", coordinates: Coordinate(latitude: 37.7983818054199, longitude: -122.407821655273), imageUrl: "http://s3-media4.fl.yelpcdn.com/bphoto/6He-NlZrAv2mDV-yg6jW3g/o.jpg", location: Location(city: "San Francisco", country: "US", address2: "", address3: "", state: "CA", address1: "373 Columbus Ave", zipcode: "94133")),
                                                             Restaurant(rating: 4.5, price: "$$", phoneNumber: "+14154212337", idName: "COPYmolinari-delicatessen-san-francisco", categories: [RestaurantCategory(alias: "delis", title: "Delis")], reviewCount: 910, name: "Molinari Delicatessen2", url: "https://www.yelp.com/biz/molinari-delicatessen-san-francisco", coordinates: Coordinate(latitude: 37.7983818054199, longitude: -122.407821655273), imageUrl: "http://s3-media4.fl.yelpcdn.com/bphoto/6He-NlZrAv2mDV-yg6jW3g/o.jpg", location: Location(city: "San Francisco", country: "US", address2: "", address3: "", state: "CA", address1: "373 Columbus Ave", zipcode: "94133")), Restaurant(rating: 4.5, price: "$$", phoneNumber: "+14154212337", idName: "COPYmolinari-delicatessen-san-francisco", categories: [RestaurantCategory(alias: "delis", title: "Delis")], reviewCount: 910, name: "Molinari Delicatessen3", url: "https://www.yelp.com/biz/molinari-delicatessen-san-francisco", coordinates: Coordinate(latitude: 37.7983818054199, longitude: -122.407821655273), imageUrl: "http://s3-media4.fl.yelpcdn.com/bphoto/6He-NlZrAv2mDV-yg6jW3g/o.jpg", location: Location(city: "San Francisco", country: "US", address2: "", address3: "", state: "CA", address1: "373 Columbus Ave", zipcode: "94133")), Restaurant(rating: 4.5, price: "$$", phoneNumber: "+14154212337", idName: "COPYmolinari-delicatessen-san-francisco", categories: [RestaurantCategory(alias: "delis", title: "Delis")], reviewCount: 910, name: "Molinari Delicatessen4", url: "https://www.yelp.com/biz/molinari-delicatessen-san-francisco", coordinates: Coordinate(latitude: 37.7983818054199, longitude: -122.407821655273), imageUrl: "http://s3-media4.fl.yelpcdn.com/bphoto/6He-NlZrAv2mDV-yg6jW3g/o.jpg", location: Location(city: "San Francisco", country: "US", address2: "", address3: "", state: "CA", address1: "373 Columbus Ave", zipcode: "94133")), Restaurant(rating: 4.5, price: "$$", phoneNumber: "+14154212337", idName: "COPYmolinari-delicatessen-san-francisco", categories: [RestaurantCategory(alias: "delis", title: "Delis")], reviewCount: 910, name: "Molinari Delicatessen5", url: "https://www.yelp.com/biz/molinari-delicatessen-san-francisco", coordinates: Coordinate(latitude: 37.7983818054199, longitude: -122.407821655273), imageUrl: "http://s3-media4.fl.yelpcdn.com/bphoto/6He-NlZrAv2mDV-yg6jW3g/o.jpg", location: Location(city: "San Francisco", country: "US", address2: "", address3: "", state: "CA", address1: "373 Columbus Ave", zipcode: "94133")), Restaurant(rating: 4.5, price: "$$", phoneNumber: "+14154212337", idName: "COPYmolinari-delicatessen-san-francisco", categories: [RestaurantCategory(alias: "delis", title: "Delis")], reviewCount: 910, name: "Molinari Delicatessen6", url: "https://www.yelp.com/biz/molinari-delicatessen-san-francisco", coordinates: Coordinate(latitude: 37.7983818054199, longitude: -122.407821655273), imageUrl: "http://s3-media4.fl.yelpcdn.com/bphoto/6He-NlZrAv2mDV-yg6jW3g/o.jpg", location: Location(city: "San Francisco", country: "US", address2: "", address3: "", state: "CA", address1: "373 Columbus Ave", zipcode: "94133"))])
    }
}

extension RestaurantResponse {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
        self.restaurants = try container.decode([Restaurant].self, forKey: .restaurants)
    }
}

public struct Restaurant: Identifiable, Decodable, Hashable, Comparable {
    public static func < (lhs: Restaurant, rhs: Restaurant) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        return false
    }
    
    var rating: Double
    var price: String?
    var phoneNumber: String?
    var idName: String
    var categories: [RestaurantCategory]
    var reviewCount: Int
    var name: String
    var url: String
    var coordinates: Coordinate
    var imageUrl: String?
    var location: Location
    var lastPreparedAt: Date? = nil
    var mapInfo: MapInfo {
        return MapInfo(name: name, coordinate: CLLocationCoordinate2D(latitude: coordinates.latitude , longitude: coordinates.longitude))
    }
    var allImages: [SingleImage] = []
//    var allImages: [SingleImage]? = nil
    
    public var id: String {
        return idName
    }
    
    private enum CodingKeys: String, CodingKey {
        case rating
        case price
        case phoneNumber = "phone"
        case idName = "id"
        case categories
        case reviewCount = "review_count"
        case name
        case url
        case coordinates
        case imageUrl = "image_url"
        case location
    }
}

public struct SingleImage: Equatable, Hashable, Identifiable{
    public var id: String
    var defaultFilename: String {
      "profile\(id)"
    }
}

extension Restaurant {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.rating = try values.decode(Double.self, forKey: .rating)
        self.price = try values.decodeIfPresent(String.self, forKey: .price)
        self.phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.idName = try values.decode(String.self, forKey: .idName)
        self.categories = try values.decode([RestaurantCategory].self, forKey: .categories)
        self.reviewCount = try values.decode(Int.self, forKey: .reviewCount)
        self.name = try values.decode(String.self, forKey: .name)
        self.url = try values.decode(String.self, forKey: .url)
        self.coordinates = try values.decode(Coordinate.self, forKey: .coordinates)
        self.imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        self.location = try values.decode(Location.self, forKey: .location)
    }
}

//Parker added this on 03/26 to make restaurantStore work
extension Restaurant {
    static let previewData: [Restaurant] =
    [
      Restaurant(
        rating: 4.5,
        price: "$$",
        phoneNumber: "+14154212337",
        idName: "molinari-delicatessen-san-francisco",
        categories: [RestaurantCategory(alias: "delis", title: "Delis")],
        reviewCount: 910,
        name: "Molinari Delicatessen",
        url: "https://www.yelp.com/biz/molinari-delicatessen-san-francisco",
        coordinates: Coordinate(latitude: 37.7983818054199, longitude: -122.407821655273),
        imageUrl: "http://s3-media4.fl.yelpcdn.com/bphoto/6He-NlZrAv2mDV-yg6jW3g/o.jpg",
        location: Location(city: "San Francisco", country: "US", address2: "", address3: "", state: "CA", address1: "373 Columbus Ave", zipcode: "94133")),
      Restaurant(rating: 4,
                 price: "$$",
                 idName: "north-india-restaurant-san-francisco",
                 categories: [RestaurantCategory(alias: "indpak", title: "Indian")],
                 reviewCount: 551,
                 name: "North India Restaurant",
                 url: "https://www.yelp.com/biz/north-india-restaurant-san-francisco",
                 coordinates: Coordinate(latitude: 37.787789124691, longitude: -122.399305736113),
                imageUrl: "https://s3-media1.fl.yelpcdn.com/bphoto/howYvOKNPXU9A5KUahEXLA/o.jpg",
                 location: Location(city: "San Francisco", country: "US", state: "CA", address1: "123 Second St", zipcode: ""))
    ]
}

extension Restaurant {
  struct FormData {
      var rating: Double
      var price: String?
      var phoneNumber: String?
      var idName: String
      var categories: [RestaurantCategory]
      var reviewCount: Int
      var name: String
      var url: String
      var coordinates: Coordinate
      var imageUrl: String?
      var location: Location
      var lastPreparedAt: Date = Date.now
      var previouslyPrepared: Bool = false
    
  }
  
  var dataForForm: FormData {
    FormData(
      rating: rating,
      price: price ?? "",
      phoneNumber: phoneNumber ?? "",
      idName: idName,
      categories: categories,
      reviewCount: reviewCount,
      name: name,
      url: url,
      coordinates: coordinates,
      imageUrl: imageUrl ?? "", //      thumbnailUrl: thumbnailUrl?.absoluteString ?? "",
      location: location, //idk if this is right, but "" sn't working
       lastPreparedAt: lastPreparedAt ?? Date.now
    )
  }
    
    static func create(from formData: FormData) -> Restaurant {
        let restaurant = Restaurant(rating: formData.rating, price: formData.price, phoneNumber: formData.phoneNumber, idName: formData.idName, categories: formData.categories, reviewCount: formData.reviewCount, name: formData.name, url: formData.url, coordinates: formData.coordinates, imageUrl: formData.imageUrl, location: formData.location)
      return Restaurant.update(restaurant, from: formData)
    }

    static func update(_ restaurant: Restaurant, from formData: FormData) -> Restaurant {
      var restaurant = restaurant
        if formData.previouslyPrepared {
            restaurant.lastPreparedAt = formData.lastPreparedAt
        }
      return restaurant
    }
  }

public struct MapInfo: Identifiable {
    public var id: UUID = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

public struct RestaurantCategory: Decodable, Hashable {
    var alias: String
    var title: String
    
    private enum CodingKeys: String, CodingKey {
        case alias
        case title
    }
}

public struct Coordinate: Identifiable, Decodable, Hashable {
  var latitude: Double
  var longitude: Double
  public var id: UUID = UUID()
  

  private enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
  }
}


public struct Location: Decodable, Hashable {
    var city: String
    var country: String
    var address2: String?
    var address3: String?
    var state: String
    var address1: String
    var zipcode: String
    
    private enum CodingKeys: String, CodingKey {
        case city
        case country
        case address2
        case address3
        case state
        case address1
        case zipcode = "zip_code"
    }
}






