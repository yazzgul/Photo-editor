import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

final class PhotoEffectCoreImageService {
    static let shared = PhotoEffectCoreImageService()

    private init () {}

    let context = CIContext()

    func getSepiaFilterImage(image: UIImage) -> UIImage? {

        let beginImage = CIImage(image: image)
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1

        guard let filteredOutputImage = currentFilter.outputImage else { return nil }
        if let cgimg = context.createCGImage(filteredOutputImage, from: filteredOutputImage.extent) {
            let filteredReadyImage = UIImage(cgImage: cgimg, scale: image.scale, orientation: image.imageOrientation)
            return filteredReadyImage
        } else {
            return nil
        }
    }

    func getNoirFilterImage(image: UIImage) -> UIImage? {

        let beginImage = CIImage(image: image)
        let currentFilter = CIFilter.photoEffectMono()
        currentFilter.inputImage = beginImage

        guard let filteredOutputImage = currentFilter.outputImage else { return nil }
        if let cgimg = context.createCGImage(filteredOutputImage, from: filteredOutputImage.extent) {
            let filteredReadyImage = UIImage(cgImage: cgimg, scale: image.scale, orientation: image.imageOrientation)
            return filteredReadyImage
        } else {
            return nil
        }
    }

    func getTonalFilterImage(image: UIImage) -> UIImage? {

        let beginImage = CIImage(image: image)
        let currentFilter = CIFilter.photoEffectTonal()
        currentFilter.inputImage = beginImage

        guard let filteredOutputImage = currentFilter.outputImage else { return nil }
        if let cgimg = context.createCGImage(filteredOutputImage, from: filteredOutputImage.extent) {
            let filteredReadyImage = UIImage(cgImage: cgimg, scale: image.scale, orientation: image.imageOrientation)
            return filteredReadyImage
        } else {
            return nil
        }
    }

    func getChromeFilterImage(image: UIImage) -> UIImage? {

        let beginImage = CIImage(image: image)
        let currentFilter = CIFilter.photoEffectChrome()
        currentFilter.inputImage = beginImage

        guard let filteredOutputImage = currentFilter.outputImage else { return nil }
        if let cgimg = context.createCGImage(filteredOutputImage, from: filteredOutputImage.extent) {
            let filteredReadyImage = UIImage(cgImage: cgimg, scale: image.scale, orientation: image.imageOrientation)
            return filteredReadyImage
        } else {
            return nil
        }
    }

    func getTransferPurpleFilterImage(image: UIImage) -> UIImage? {

        let beginImage = CIImage(image: image)
        let currentFilter = CIFilter.photoEffectTransfer()
        currentFilter.inputImage = beginImage

        guard let filteredOutputImage = currentFilter.outputImage else { return nil }
        if let cgimg = context.createCGImage(filteredOutputImage, from: filteredOutputImage.extent) {
            let filteredReadyImage = UIImage(cgImage: cgimg, scale: image.scale, orientation: image.imageOrientation)
            return filteredReadyImage
        } else {
            return nil
        }
    }

}

