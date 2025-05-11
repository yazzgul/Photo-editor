import SwiftUI
import AVFoundation

final class PickerHelper {

    static let shared = PickerHelper()

    private init () {}

    func checkPermissions() throws {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .denied:
                throw Picker.PickerError.denied
            case .restricted:
                throw Picker.PickerError.restricted
            default:
                break
            }
        } else {
            throw Picker.PickerError.unavailable
        }
    }

}
