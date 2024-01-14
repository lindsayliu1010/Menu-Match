import SwiftUI
import PhotosUI

//struct Profile{
//  var id: Int = 1
//  var defaultFilename: String {
//    "profile\(id)"
//  }
//}

struct PastMatchDetail: View {
    @EnvironmentObject var restaurantStore: RestaurantStore
    @EnvironmentObject var restaurantLoader: RestaurantLoader
    @EnvironmentObject var reviewLoader: ReviewLoader
    @Binding var restaurant: Restaurant
    //    @StateObject var photoService = PhotoTransferService()
    @State var savedPhotos = [Image]()
    @State private var selectedItems = [PhotosPickerItem]()
    
    
    var body: some View {
        ScrollView{
            RestaurantProfile(restaurant: $restaurant)
            
            ScrollView {
                LazyVStack {
                    if restaurant.allImages != nil {
                        ForEach(restaurant.allImages){ photo in
                            if let profileImage = FileUtils.fetchImageFromFile(filename: photo.defaultFilename) {
                                profileImage
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                
                            }
                        }
                    }
                }
            }.toolbar{
                VStack {
                    PhotosPicker(selection: $selectedItems,
                                 matching: .images,
                                 photoLibrary: .shared()){
                        Text("Upload Image")
                            .buttonStyle(.borderedProminent)
                        .foregroundColor(Color("background color 2"))}
                                 .onChange(of: selectedItems){ _ in
                                     Task{
                                         savedPhotos.removeAll()
                                         
                                         var intID = 0
                                         for item in selectedItems {
                                             
                                             var profile = SingleImage(id: restaurant.id + "\(intID)")
//
                                             if let data = try? await item.loadTransferable(type: Data.self) {
                                                 if let uiImage = UIImage(data: data) {
//                                                     let image = Image(uiImage: uiImage)
//                                                     savedPhotos.append(image)
                                                     
                                                     do {
                                                         try FileUtils.saveImageToFile(image: uiImage, filename: profile.defaultFilename)
//                                                       photoService.reset()
                                                         restaurant.allImages.append(profile)
                                                         
                                                     } catch {
                                                       print("There was an error")
                                                     }
                                                 }
                                             }
                                             intID = intID+1
                                         }
                                     }
                                     
                                 }
                }.onChange(of: restaurant.allImages){print("this is testing for all images", $0.count)}
            }
            
            
        }
    }
    
    struct CurrentSelectionDisplay: View {
        let imageState: PhotoTransferService.ImageState
        
        var body: some View {
            switch imageState {
            case .success(let image):
                //      Text("This is what you picked!")
                image.resizable()
            case .loading:
                ProgressView()
            case .empty:
                Image(systemName: "person.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            case .failure:
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
        }
    }
    
    struct PastMatchDetail_Previews: PreviewProvider {
        static var previews: some View {
            PastMatchDetail(restaurant: Binding.constant( Restaurant.previewData[0]))
                .environmentObject(RestaurantStore())
                .environmentObject(RestaurantLoader(apiClient: MockRestaurantAPIClient()))
                .environmentObject(ReviewLoader(apiClient: MockRestaurantAPIClient()))
        }
    }
}
