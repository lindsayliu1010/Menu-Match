import SwiftUI
import MapKit


struct MatchMap: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    @State var region: MKCoordinateRegion = MKCoordinateRegion(.world)

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: restaurantStore.restaurants){ restaurant in
            MapAnnotation(coordinate: restaurant.mapInfo.coordinate) {
                MySimpleAnnotation(restaurant: restaurant)
            }
        }
        .task { updateMapRegion() }
    }

    func updateMapRegion() {
        self.region = LocationUtilities.coordinateRegion(for: self.restaurantStore.restaurants.map(\.mapInfo.coordinate))
    }
}

struct MySimpleAnnotation: View {
    let restaurant: Restaurant

    var body: some View {
        VStack {
            Image(systemName: "mappin")
                .foregroundColor(.red)
                .font(.largeTitle)
            Text(restaurant.name)
                .padding(2)
                .background(Rectangle().foregroundColor(Color(white: 0.9)))
        }
    }
}

struct MatchMap_Previews: PreviewProvider {
    static var previews: some View {
        MatchMap()
            .environmentObject(RestaurantStore())

    }
}
