import SwiftUI

struct WinnerView: View {
    @State var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Text("Winner!")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .padding()
            
            Text(restaurant.name)
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text(restaurant.location.address1)
                .font(.title2)
                .multilineTextAlignment(.center)
            
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
                    .cornerRadius(6)
                    .frame(maxWidth: 300)
                    .padding()
                }
            }
            
            NavigationLink(destination: WelcomeView()){
                Text("Match Again")
            }
            .navigationBarBackButtonHidden(true)
            .buttonStyle(.borderedProminent)
            .tint(Color("background color 2"))
            .padding()
            
        }
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(restaurant: Restaurant.previewData[0])
    }
}
