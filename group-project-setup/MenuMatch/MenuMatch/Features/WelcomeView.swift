import SwiftUI
import CoreLocation

struct WelcomeView: View {
    @EnvironmentObject var restaurantLoader: RestaurantLoader
    @EnvironmentObject var preferenceStore: PreferenceStore
    
    @State var coordinate: Coordinate = Coordinate(latitude: 37.786882, longitude: -122.399972)
    
    @State var isPresentingPreferenceForm: Bool = false
    @State var newPreferenceFormData = Preference.FormData()
    
    var body: some View {
            NavigationStack {
                WelcomeDisplay()
                    .task { await restaurantLoader.loadRestaurants(coordinate: coordinate)}
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Edit Preferences") { isPresentingPreferenceForm.toggle() }
                        }
                    }
            }
            
            //right now it's adding to a list of preferences, like RecipeStore from homework 4, which isn't what we want. We can fix it up more soon.
            .sheet(isPresented: $isPresentingPreferenceForm) {
                NavigationStack {
                    PreferencesForm(data: $newPreferenceFormData)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Cancel") { isPresentingPreferenceForm = false }
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Save") {
                                    let newPreference = Preference.create(from: newPreferenceFormData)
                                    preferenceStore.createPreference(newPreference)
                                    isPresentingPreferenceForm = false
                                }
                            }
                        }
                }
                .padding()
            }
        }
    }

struct WelcomeDisplay: View {
    @EnvironmentObject var restaurantLoader: RestaurantLoader
    
    var body: some View {
        VStack {
            Text("Are you hungry?")
                .font(.title2)
            
            switch restaurantLoader.state{
            case .idle: Color.clear
            case .loading: ProgressView()
            case .failed: Text("error")
            case .success(let test):
                NavigationLink(destination: StartCompetitionView(restaurantResponse: test)){
                    Text("MATCH ME")
                        .padding(10)
                        .border(Color("background color 2"))
                        .foregroundColor(Color.white)
                        .background(Color("background color 2"))
                        .cornerRadius(6)
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(RestaurantLoader(apiClient: MockRestaurantAPIClient()))
            .environmentObject(PreferenceStore())

    }
}
