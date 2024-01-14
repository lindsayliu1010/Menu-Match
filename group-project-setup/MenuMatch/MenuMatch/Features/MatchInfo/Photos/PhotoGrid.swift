//import SwiftUI
//
//struct PhotoGrid: View {
//  @StateObject var photoService = PhotoTransferService()
//  @State var savedPhotos: [PhotoFromLibrary] = []
//
//  var body: some View {
//    VStack {
//      PhotosPicker(selection: $photoService.imageSelection,
//                   matching: .images,
//                   photoLibrary: .shared()) {
//        Image(systemName: "pencil.circle.fill")
//          .symbolRenderingMode(.multicolor)
//          .font(.system(size: 30))
//          .foregroundColor(.accentColor)
//      }
//      CurrentSelectionDisplay(imageState: photoService.imageState)
//      if case .success(let image) = photoService.imageState  {
//        Button("Add") {
//          savedPhotos.append(PhotoFromLibrary(photo: image))
//        }
//      }
//
//      if !savedPhotos.isEmpty {
//        Text("Saved Photos")
//          .font(.headline)
//      }
//      ScrollView {
//        LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
//          ForEach(savedPhotos) { photo in
//            photo.photo
//              .resizable()
//              .aspectRatio(contentMode: .fit)
//          }
//        }
//      }
//    }
//  }
//
//  private var columns: [GridItem] = [
//    GridItem(.flexible()),
//    GridItem(.flexible()),
//    GridItem(.flexible())
//  ]
//}
//
//import SwiftUI
//import PhotosUI
//
//struct CurrentSelectionDisplay: View {
//  let imageState: PhotoTransferService.ImageState
//
//  var body: some View {
//    switch imageState {
//    case .success(let image):
//      Text("This is what you picked!")
//      image.resizable()
//    case .loading:
//      ProgressView()
//    case .empty:
//      Image(systemName: "person.fill")
//        .font(.system(size: 40))
//        .foregroundColor(.white)
//    case .failure:
//      Image(systemName: "exclamationmark.triangle.fill")
//        .font(.system(size: 40))
//        .foregroundColor(.white)
//    }
//  }
//}
//
//struct PhotoGrid_Previews: PreviewProvider {
//  static var previews: some View {
//    PhotoGrid()
//  }
//}
