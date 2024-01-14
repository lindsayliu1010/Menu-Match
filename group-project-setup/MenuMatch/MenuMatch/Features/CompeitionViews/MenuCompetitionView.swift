import SwiftUI

struct MenuCompetitionView: View {
    @State var RestaurantResponse: RestaurantResponse
    @State var chose1 = false
    @State var chose2 = false
    
    //I need to add this in but i don't wanna cause issues
    @EnvironmentObject var restaurantStore: RestaurantStore

    
    
    var body: some View {
        NavigationStack{
            VStack {
                Text(RestaurantResponse.restaurants[0].name)
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: RestaurantProfile(restaurant: $RestaurantResponse.restaurants[0])) {
                    Text("See Profile")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            if chose1 {
                NavigationLink(destination: WelcomeView()) {
                    Text("CLICK HERE TO FINALIZE CHOICE")
                }
            }
            else {
                Text("Select Below")
            }
                
            Button(action: {
                if chose1 == false {
                    chose1 = true
                    chose2 = false
                    
                    restaurantStore.addRestaurant(RestaurantResponse.restaurants[0])
                }
                else {
                   chose1 = false
                    restaurantStore.deleteRestaurant(RestaurantResponse.restaurants[0])
                }
            }) {
                Text("Choose This")
            }
            .padding()
            
            Divider()
            
            VStack {
                Text(RestaurantResponse.restaurants[1].name)
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: RestaurantProfile(restaurant: $RestaurantResponse.restaurants[1])) {
                    Text("See Profile")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            
            if chose2 {
                NavigationLink(destination: WelcomeView()) {
                    Text("CLICK HERE TO FINALIZE CHOICE")
                    
                }
            }
            else {
                Text("Select Below")
            }
                
            Button(action: {
                if chose2 == false {
                    chose2 = true
                    chose1 = false
                
                    //restaurantStore.addRestaurant(restaurant: RestaurantResponse.restaurants[1])

                }
                else {
                   chose2 = false
//                    restaurantStore.deleteRestaurant(restaurant: RestaurantResponse.restaurants[1])
                }
            }) {
                Text("Choose This")
            }
            .padding()
            
        }
        
        
        //uncomment the below to get it to work
//        VStack {
//            Text(RestaurantResponse.restaurants[0].name)
//                .font(.title)
//          //  Text(RestaurantResponse.restaurant[1].name)
//             //   .font(.title)
//
//            //display image as soon as I figure out the issues
//
////            NavigationLink(destination: RestaurantProfile(restaurant: $RestaurantResponse.restaurants[0])) {
////                Text("View Profile")
////                    .font(.title)
////            }
//            .buttonStyle(.borderedProminent)
//            .foregroundColor(.blue)
//
//            Text("Choose This Restaurant")
//
//        }
//        .padding()
        
        
    }
}

//struct MenuCompetitionView: View {
//    //This will change to an array but for display purposes it is 2 restaurants
////    @State var restaurant1: Restaurant
////    @State var restaurant2: Restaurant
//
//    var body: some View {
//        VStack {
//            Text("Restaurant1")
//            Divider()
//            Text("Restaurant2")
// //            RestaurantGameDisplay(restaurant: $restaurant1)
// //            RestaurantGameDisplay(restaurant: $restaurant2)
//        }
//    }
// }

struct MenuCompetitionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCompetitionView(RestaurantResponse: RestaurantResponse.mock())
//        needs to be added in :(
            .environmentObject(RestaurantStore())

            
    }
}
