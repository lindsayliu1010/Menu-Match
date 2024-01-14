import SwiftUI

struct Round1: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    @State var winner: Restaurant
    @State var newRestaurant: Restaurant
    @State var index: Int
    @Binding var restaurants: [Restaurant]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(winner.name)
                    .font(.title)
                
                if let urlToImage = winner.imageUrl {
                    if !urlToImage.isEmpty {
                        let imageUrl = URL(string: urlToImage)
                        AsyncImage(url: imageUrl, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }, placeholder: {
                            if winner.imageUrl != "" {
                                ProgressView()
                            } else {
                                Image(systemName: "fork.knife")
                            }
                        })
                        .cornerRadius(6)
                    
                        
                    }
                }
                
                NavigationLink(destination: RestaurantProfile(restaurant: $winner)){
                    Text("See Profile")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .tint(Color("background color 2"))
                
                NavigationLink(destination: Round2(winner: winner, newRestaurant: restaurants[index+1], index: index+1, restaurants: $restaurants)){
                    Text("Choose This Restaurant")
                }
                .navigationBarBackButtonHidden(true)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .padding()
            }
            
            Divider()
            
            VStack {
                Text(newRestaurant.name)
                    .font(.title)
                
                if let urlToImage = newRestaurant.imageUrl {
                    if !urlToImage.isEmpty {
                        let imageUrl = URL(string: urlToImage)
                        AsyncImage(url: imageUrl, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }, placeholder: {
                            if newRestaurant.imageUrl != "" {
                                ProgressView()
                            } else {
                                Image(systemName: "fork.knife")
                            }
                        })
                        .cornerRadius(6)
                   
                        
                    }
                }
                
                NavigationLink(destination: RestaurantProfile(restaurant: $newRestaurant)){
                    Text("See Profile")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .tint(Color("background color 2"))
                
                NavigationLink(destination: Round2(winner: newRestaurant, newRestaurant: restaurants[index+1], index: index+1, restaurants: $restaurants)){
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

struct Round1_Previews: PreviewProvider {
    static var previews: some View {
        Round1(winner: Restaurant.previewData[0], newRestaurant: Restaurant.previewData[1], index: 1, restaurants: Binding.constant(Restaurant.previewData))
            .environmentObject(RestaurantStore())
    }
}
