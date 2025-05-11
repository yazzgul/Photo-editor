import SwiftUI

final class TextHelperService {
    static let shared = TextHelperService()

    private init () {}
//---
    func addTextToImage(image: UIImage, fontSize: CGFloat, textColor: Color, textPosition: CGSize, text: String) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: image.size)
        let newImage = renderer.image { context in
            image.draw(at: .zero)

//            let attributes: [NSAttributedString.Key: Any] = [
//                .font: UIFont.systemFont(ofSize: fontSize, weight: .regular),
//                .foregroundColor: UIColor(textColor)
//            ]
            let attributes = [
              NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .body),
              NSAttributedString.Key.foregroundColor : UIColor.black
            ]
//            let textSize = text.size(withAttributes: attributes)

            let textRect = CGRect(x: textPosition.width, y: textPosition.height, width: image.size.width, height: image.size.height)

            text.draw(in: textRect, withAttributes: attributes)

        }

        return newImage
    }

}
