import SwiftUI

struct StartCompetitionView: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    @State var restaurantResponse: RestaurantResponse
    
    var body: some View {
        var index: Int = 1
        var restaurant1: Restaurant = restaurantResponse.restaurants[0]
        var restaurant2: Restaurant = restaurantResponse.restaurants[index]
        
        NavigationStack {
            VStack {
                Text(restaurant1.name)
                    .font(.title)
                
                if let urlToImage = restaurant1.imageUrl {
                    if !urlToImage.isEmpty {
                        let imageUrl = URL(string: urlToImage)
                        AsyncImage(url: imageUrl, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }, placeholder: {
                            if restaurant1.imageUrl != "" {
                                ProgressView()
                            } else {
                                Image(systemName: "fork.knife")
                            }
                        })
                        .cornerRadius(6)
                    }
                }
                
                NavigationLink(destination: RestaurantProfile(restaurant: $restaurantResponse.restaurants[index-1])){
                    Text("See Profile")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .tint(Color("background color 2"))
                
                NavigationLink(destination: Round1(winner: restaurant1, newRestaurant: restaurantResponse.restaurants[index+1], index: index+1, restaurants: $restaurantResponse.restaurants)){
                    Text("Choose This Restaurant")
                }
                .navigationBarBackButtonHidden(true)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .padding()
            }
            
            Divider()
            
            VStack {
                Text(restaurant2.name)
                    .font(.title)
                
                if let urlToImage = restaurant2.imageUrl {
                    if !urlToImage.isEmpty {
                        let imageUrl = URL(string: urlToImage)
                        AsyncImage(url: imageUrl, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }, placeholder: {
                            if restaurant2.imageUrl != "" {
                                ProgressView()
                            } else {
                                Image(systemName: "fork.knife")
                            }
                        })
                        .cornerRadius(6)
                    }
                }
                
                NavigationLink(destination: RestaurantProfile(restaurant: $restaurantResponse.restaurants[index])){
                    Text("See Profile")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .tint(Color("background color 2"))
                
                NavigationLink(destination: Round1(winner: restaurant2, newRestaurant: restaurantResponse.restaurants[index+1], index: index+1, restaurants: $restaurantResponse.restaurants)){
                    Text("Choose This Restaurant")
                }
                .navigationBarBackButtonHidden(true)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .padding()
            }
        }
    }
}


struct StartCompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        StartCompetitionView(restaurantResponse: RestaurantResponse.mock())
            .environmentObject(RestaurantStore())
    }
}

