import SwiftUI

struct PastMatchesList: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    @EnvironmentObject var restaurantLoader: RestaurantLoader
    @EnvironmentObject var reviewLoader: ReviewLoader
    
    var body: some View {
        NavigationStack{
            if restaurantStore.restaurants.isEmpty {
                Text("No past restaurants")
            }
            else {
                List($restaurantStore.restaurants){ $restaurant in
                    NavigationLink(destination: PastMatchDetail(restaurant: $restaurant)){
                        VStack {
                            Text(restaurant.name)
                        }
                    }
                    .swipeActions(edge: .trailing) {
                      Button(role: .destructive) {
                          restaurantStore.deleteRestaurant(restaurant)
                      } label: { Label("Delete", systemImage: "trash") }
                    }
                }
            }
        }
    }
}

struct PastMatchesList_Previews: PreviewProvider {
    static var previews: some View {
        PastMatchesList()
            .environmentObject(RestaurantStore())
            .environmentObject(RestaurantLoader(apiClient: MockRestaurantAPIClient()))
            .environmentObject(ReviewLoader(apiClient: MockRestaurantAPIClient()))
    }
}
