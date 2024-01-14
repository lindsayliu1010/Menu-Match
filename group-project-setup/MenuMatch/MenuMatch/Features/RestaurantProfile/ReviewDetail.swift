import SwiftUI

struct ReviewDetail: View {
    @EnvironmentObject var reviewLoader: ReviewLoader
    @State var restaurantIdName: String
    
    var body: some View {
        VStack {
            switch reviewLoader.state {
            case .idle: Color.clear
            case .loading: ProgressView()
            case .failed(let error): Text("Error \(error.localizedDescription)")
            case .success(let result):
                ReviewDisplay(result: result)
            }
        }
        .task {await reviewLoader.loadReviews(restaurantIdName: restaurantIdName)}
    }
}

struct ReviewDisplay: View {
    @EnvironmentObject var reviewLoader: ReviewLoader
    let result: ReviewResponse
    
    var body: some View {
        VStack (alignment: .leading){
            ForEach(result.reviews, id: \.self) { review in
                VStack (alignment: .leading){
                    
                    if let userName = review.user.name {
                        Text(userName)
                            .font(.headline)
                            .padding(.leading)
                    }
                        
                    HStack {
                        StarDisplay(rating: review.rating)
                            .frame(maxWidth: 80)
                            .padding(.leading)
                        Text(String(review.rating))
                            
                    }
                        
                    Text(review.review)
                        .padding([.leading, .bottom, .trailing])
                    
                }
            }
        }
    }
}

struct ReviewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetail(restaurantIdName: Restaurant.previewData[0].idName)
            .environmentObject(ReviewLoader(apiClient: MockRestaurantAPIClient()))
    }
}
