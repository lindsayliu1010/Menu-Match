import SwiftUI

struct TabContainer: View {
    var body: some View {
            TabView {
                WelcomeView()
                    .tabItem {
                        Label("Match Me", systemImage: "fork.knife")
                    }
                MatchInfo()
                    .tabItem {
                        Label("Match Info", systemImage: "questionmark")
                    }
            }
            .accentColor(Color("background color 2"))
    }
}

struct TabContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabContainer()
            .environmentObject(RestaurantLoader(apiClient: MockRestaurantAPIClient()))
            .environmentObject(ReviewLoader(apiClient: MockRestaurantAPIClient()))
            .environmentObject(RestaurantStore())
            .environmentObject(PreferenceStore())
    }
}
