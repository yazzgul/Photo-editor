import SwiftUI

final class PhotoLibraryHelper {
    static let shared = PhotoLibraryHelper()

    private init () {}

    func saveImageToUserLibrary(image : UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
