import SwiftUI

enum Picker {
    enum Source: String {
        case library, camera
    }
    enum PickerError: Error, LocalizedError {
        case unavailable
        case restricted
        case denied

        var errorDescription: String? {
            switch self {
            case .unavailable:
                return NSLocalizedString("There is no available camera on device", comment: "")
            case .restricted:
                return NSLocalizedString("There is no available camera on device", comment: "")
            case .denied:
                return NSLocalizedString("You have explicitly denied permission for media capture. Please open permissions/Privacy/Camera and grant access for this application.", comment: "")
            }
        }
    }

    struct CameraErrorType {
        let error: Picker.PickerError
        var message: String {
            error.localizedDescription
        }
    }
}
