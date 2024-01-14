import SwiftUI

struct StarDisplay: View {
    var rating: Double
    var maxRating: Int = 5
    
    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30)
            }
        }
        
        stars.overlay(
            GeometryReader { g in
                let width =  rating / Double(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
                .mask(stars)
        )
        .foregroundColor(.gray)
    }
}

struct StarDisplay_Previews: PreviewProvider {
    static var previews: some View {
        StarDisplay(rating: Restaurant.previewData[0].rating)
    }
}
