import SwiftUI

@main
struct MenuMatchApp: App {
    @StateObject var restaurantLoader = RestaurantLoader(apiClient: RestaurantAPIClient())
    @StateObject var reviewLoader = ReviewLoader(apiClient: RestaurantAPIClient())
    @StateObject var restaurantStore = RestaurantStore()
    @StateObject var preferenceStore = PreferenceStore()
    
    var body: some Scene {
        WindowGroup {
            TabContainer()
                .environmentObject(restaurantLoader)
                .environmentObject(reviewLoader)
                .environmentObject(restaurantStore)
                .environmentObject(preferenceStore)
        }
    }
}
