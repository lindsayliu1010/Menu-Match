import Foundation
import CoreLocation

struct Preference: Identifiable {
    var id: UUID = UUID()
    var price: String?
    var radius: String?
    var rating: String?
}

extension Preference {
  struct FormData {
    var price: String = ""
    var radius: String = ""
    var rating: String = ""
  }
  
  var dataForForm: FormData {
    FormData(
      price: price ?? "",
      radius: radius ?? "",
      rating: rating ?? ""
    )
  }
    static func create(from formData: FormData) -> Preference {
      let preference = Preference()
      return Preference.update(preference, from: formData)
    }

    static func update(_ preference: Preference, from formData: FormData) -> Preference {
      var preference = preference
      preference.price = formData.price.isEmpty ? nil : formData.price
        preference.radius = formData.radius.isEmpty ? nil : formData.radius
        preference.rating = formData.rating.isEmpty ? nil : formData.rating
      return preference
    }
  }

extension Preference {
  static let previewData: [Preference] = [
    Preference(
        price: "1",
        radius: "1",
        rating: "1"
    )
  ]
}
