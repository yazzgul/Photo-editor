import SwiftUI

final class MainScreenViewModel: ObservableObject {
    @Published var image: UIImage?
    private var originalWithoutFilterImage: UIImage?

    @Published var showPicker = false
    @Published var source: Picker.Source = .library

    @Published var showCameraAlert = false
    @Published var cameraError: Picker.CameraErrorType?

    @Published var showFileAlert = false
    @Published var appError: MyImageError.ErrorType?

    @Published var imageName: String = "photo-from-editor-app"
    private var mySelectedImage: MyImage?

    @Published var rotationAngleDegrees: Double = 0

    @Published var isCanvasViewSheetPresent = false
    @Published var showCanvasViewAlert = false

    @Published var userFontSize: CGFloat = 24
    @Published var userOverlayText: UserOverlayText?
    @Published var userTextPosition: CGSize = .zero
    @Published var userCurrentTextForTextField: String = ""
    @Published var showUserCurrentTextForTextfield = false
//    let availableFonts: [Font] = [.body, .title, .largeTitle, .caption]
    @Published var userTextColor: Color = .black
    @Published var selectedFontType: TextFontType = .body

    @Published var textPosition: CGSize = CGSize(width: 100, height: 100)

    @Published var showSheetShare = false

    @Published var showImageNotExistSheet = false

    init() {
        print(FileManager.docDirURL.path)
    }

    func tapUserCurrentTextButtonForTextfield() {
        checkImageNotExistSheet()
        if image != nil {
            showUserCurrentTextForTextfield = true
        }
    }
    func showSheetShareCheckingImage() {
        checkImageNotExistSheet()
        if image != nil {
            showSheetShare = true
        }
    }

    func saveImageToUserLibrary() {
        checkImageNotExistSheet()
        if let imageUnwrapped = image {
            PhotoLibraryHelper.shared.saveImageToUserLibrary(image: imageUnwrapped)
        }
    }
//    func imageExists() -> Bool {
//        if image != nil {
//            return true
//        }
//        return false
//    }
    func checkImageNotExistSheet() {
        if image == nil  {
            showImageNotExistSheet = true
        }
    }

    var rotationAngle: Angle {
        Angle(degrees: rotationAngleDegrees)
    }
    func showCanvasView() {
        checkImageNotExistSheet()
        if image != nil {
//            showCanvasViewAlert = false
            isCanvasViewSheetPresent.toggle()
        } else {
//            showCanvasViewAlert = true

        }
    }

    func rotateLeft() {
        checkImageNotExistSheet()
        if image != nil {
            rotationAngleDegrees += 90
        }
    }


    func rotateRight() {
        checkImageNotExistSheet()
        if image != nil {
            rotationAngleDegrees -= 90
        }
    }

    func showPhotoPicker() {
        do {
            if source == .camera {
                try PickerHelper.shared.checkPermissions()
            }
            showPicker = true

        } catch {
            showCameraAlert = true
            cameraError = Picker.CameraErrorType(error: error as! Picker.PickerError)
        }
    }
///    Функция для сохранения фото на устройство (в документы)
    func addMyImage(name: String, image: UIImage) {
        let myImage = MyImage(name: name)
        do {
            try FileManager().saveImage("\(myImage.id)", image: image)
            mySelectedImage = myImage
//            saveImageJSONFile()
        } catch {
//            showFileAlert = true
            appError = MyImageError.ErrorType(error: error as! MyImageError)
        }
    }
    
    func addTextToImage() {
        if image != nil {
            let newImage = TextHelperService.shared.addTextToImage(
                image: image!, fontSize: userFontSize, textColor: userTextColor, textPosition: textPosition, text: userCurrentTextForTextField)
            image = newImage
        }

    }

    func saveImageJSONFile() {
        let encoder = JSONEncoder()
        do {
            if let mySelectedImageUnwrapped = mySelectedImage {
                let data = try encoder.encode(mySelectedImageUnwrapped)

                let jsonString  = String(decoding: data, as: UTF8.self)
                do {
                    try FileManager().saveDocument(contents: jsonString)
                } catch {
                    print("Error in saveImageJSONFile: \(error.localizedDescription)")
                    appError = MyImageError.ErrorType(error: error as! MyImageError)
                }
            } else {
                return
            }
        } catch {
            print("Error in saveImageJSONFile: \(error.localizedDescription)")
            appError = MyImageError.ErrorType(error: .encodingError)
        }
    }

    func makeSepiaEffect() {
        if image != nil {

            if !checkOriginalWithoutFilterImageExists() {
                originalWithoutFilterImage = image!
            }

            if let newImage = PhotoEffectCoreImageService.shared.getSepiaFilterImage(image: image!) {
                image = newImage
            } else {
                return
            }
        }
    }

    func makeNoirEffect() {
        if image != nil {

            if !checkOriginalWithoutFilterImageExists() {
                originalWithoutFilterImage = image!
            }

            if let newImage = PhotoEffectCoreImageService.shared.getNoirFilterImage(image: image!) {
                image = newImage
            } else {
                return
            }
        }
    }

    func makeTonalEffect() {
        if image != nil {

            if !checkOriginalWithoutFilterImageExists() {
                originalWithoutFilterImage = image!
            }

            if let newImage = PhotoEffectCoreImageService.shared.getTonalFilterImage(image: image!) {
                image = newImage
            } else {
                return
            }
        }
    }

    func makeChromeEffect() {
        if image != nil {

            if !checkOriginalWithoutFilterImageExists() {
                originalWithoutFilterImage = image!
            }

            if let newImage = PhotoEffectCoreImageService.shared.getChromeFilterImage(image: image!) {
                image = newImage
            } else {
                return
            }
        }
    }

    func makeTransferPurpleEffect() {
        if image != nil {

            if !checkOriginalWithoutFilterImageExists() {
                originalWithoutFilterImage = image!
            }

            if let newImage = PhotoEffectCoreImageService.shared.getTransferPurpleFilterImage(image: image!) {
                image = newImage
            } else {
                return
            }
        }
    }

    func makeClearImage() {
        if checkOriginalWithoutFilterImageExists() {
            image! = originalWithoutFilterImage!
        }
    }

    func checkOriginalWithoutFilterImageExists() -> Bool {
        if originalWithoutFilterImage != nil {
            return true
        }
        else {
            return false
        }
    }

    func applyEffect(effect: PhotoEffect) {
        checkImageNotExistSheet()
        switch effect {
        case .noir:
            makeNoirEffect()
        case .tonal:
            makeTonalEffect()
        case .chrome:
            makeChromeEffect()
        case .transfer:
            makeTransferPurpleEffect()
        case .sepia:
            makeSepiaEffect()
        case .clear:
            makeClearImage()
        }
    }


}
