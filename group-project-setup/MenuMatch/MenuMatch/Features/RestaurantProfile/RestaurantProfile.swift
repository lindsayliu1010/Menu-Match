import SwiftUI

struct RestaurantProfile: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    @EnvironmentObject var restaurantLoader: RestaurantLoader
    @EnvironmentObject var reviewLoader: ReviewLoader
    @Binding var restaurant: Restaurant
    @EnvironmentObject var preferenceStore: PreferenceStore
    
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text(restaurant.name)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing])
                    
                    Text(restaurant.location.address1)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing])
                    
                    if let urlToImage = restaurant.imageUrl {
                        if !urlToImage.isEmpty {
                            let imageUrl = URL(string: urlToImage)
                            AsyncImage(url: imageUrl, content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }, placeholder: {
                                if restaurant.imageUrl != "" {
                                    ProgressView()
                                } else {
                                    Image(systemName: "fork.knife")
                                }
                            })
                            .frame(maxWidth: 300)
                            .cornerRadius(6)
                            .padding()
                            
                        }
                    }
                }
                
                Group {
                    VStack {
                        Text("Price")
                            .font(.title2)
                        if let price = restaurant.price {
                            Text(price)
                        } else {
                            Text("No Pricing Avaliable")
                        }
                    }
                    
                    Text("Rating")
                        .font(.title2)
                        .padding(.top)
                    StarDisplay(rating: restaurant.rating)
                    Text(String(restaurant.rating))
                        .padding(.bottom)
                    
                    Text("Website")
                        .font(.title2)
                    Link(String(restaurant.url), destination: URL(string: restaurant.url)!)
                        .font(.headline)
                        .padding([.leading, .trailing])
                    
                    
                    Text("Reviews")
                        .font(.title2)
                        .padding(.top)
                    
                    if restaurant.reviewCount != 0 {
                        ReviewDetail(restaurantIdName: restaurant.idName)
                    }
                    else {
                        Text("no reviews")
                    }
                }
            }
        }
    }
}

struct RestaurantProfile_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantProfile(restaurant: Binding.constant(Restaurant.previewData[0]))
            .environmentObject(RestaurantStore())
            .environmentObject(RestaurantLoader(apiClient: MockRestaurantAPIClient()))
            .environmentObject(ReviewLoader(apiClient: MockRestaurantAPIClient()))
            .environmentObject(PreferenceStore())
    }
}
