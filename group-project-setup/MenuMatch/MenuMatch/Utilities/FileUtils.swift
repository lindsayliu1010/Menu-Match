import Foundation
import UIKit
import SwiftUI

struct FileUtils {
  static func saveImageToFile(image: UIImage?, filename: String) throws {
    if let image,
       let data = image.pngData() {
      let path = getDocumentsDirectory().appendingPathComponent(filename)
      try data.write(to: path)
        print("the path is", path)
    }
  }

  static func fetchImageFromFile(filename: String) -> Image? {
    let path = getDocumentsDirectory().appendingPathComponent(filename)
    if let data = try? Data(contentsOf: path),
       let image = UIImage(data: data) {
        return Image(uiImage: image)
    } else {
       print("Can't create image from file \(path)")
      return nil
    }
  }

  static func getDocumentsDirectory() -> URL {
      let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      return paths[0]
  }
}
