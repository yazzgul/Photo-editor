import Foundation

enum MyImageError: Error, LocalizedError {
    case readError
    case decodingError
    case encodingError
    case saveError
    case saveImageError
    case readImageError

    var errorDescription: String? {
        switch self {
        case .readError:
            return NSLocalizedString("Could not load MyImage.json. Please, reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your list of image., Please, create a new image", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not save MyImage data. Please, reinstall the app.", comment: "")
        case .saveError:
            return NSLocalizedString("Could not save the MyImage json file. Please, reinstall the app.", comment: "")
        case .saveImageError:
            return NSLocalizedString("Could not save Image. Please, reinstall the app.", comment: "")
        case .readImageError:
            return NSLocalizedString("Could not load Image. Please, reinstall the app.", comment: "")
        }

    }
    struct ErrorType: Identifiable {
        let id = UUID()
        let error: MyImageError
        var message: String {
            error.localizedDescription
        }
        
    }
}
