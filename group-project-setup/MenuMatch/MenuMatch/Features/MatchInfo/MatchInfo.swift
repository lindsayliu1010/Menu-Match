import SwiftUI

struct MatchInfo: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: PastMatchesList()) {
                    Text("Past Matches")
                }
                NavigationLink(destination: MatchMap()){
                    Text("Match Map")
                }
                NavigationLink(destination: MatchChart()){
                    Text("Match Chart")
                }
            }
        }
    }
}

struct MatchInfo_Previews: PreviewProvider {
    static var previews: some View {
        MatchInfo()
            .environmentObject(RestaurantStore())
    }
}
