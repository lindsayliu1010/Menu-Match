import SwiftUI
import Charts

struct MatchChart: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    @EnvironmentObject var restaurantLoader: RestaurantLoader
    @EnvironmentObject var reviewLoader: ReviewLoader
    
    var body: some View {
        VStack {
            Text("MatchChart 📈")
                .font(.largeTitle)
                .bold()
                
            Text("💰 Price Chart 💰")
                .font(.title2)
                .padding(1)
                .bold()
                .multilineTextAlignment(.center)
            Text("Cash Rules Everything Around Me:")
                .italic()
            Text("Track the prices of your previous matches here")
                .multilineTextAlignment(.center)
            Chart(restaurantStore.pricingData, id: \.price) { item in
                    BarMark(
                        x: .value("Category", item.price),
                        y: .value("Value", item.count)
                    )
                }
            .padding()
            
            Text("⭐ Rating Chart ⭐")
                .font(.title2)
                .padding(1)
                .bold()
                .multilineTextAlignment(.center)
            Text("To Eat or Not To Eat:")
                .multilineTextAlignment(.center)
                .italic()
            Text("Track the star ratings of your previous matches here")
                .multilineTextAlignment(.center)
            Chart(restaurantStore.starsData, id: \.star) { item in
                    BarMark(
                        x: .value("Category", item.star),
                        y: .value("Value", item.count)
                    )
                }
            .padding()
        }
    }
}

struct MatchChart_Previews: PreviewProvider {
    static var previews: some View {
        MatchChart()
            .environmentObject(RestaurantStore())
    }
}
