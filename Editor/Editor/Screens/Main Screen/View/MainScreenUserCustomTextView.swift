import SwiftUI

struct MainScreenUserCustomTextView: View {
    
    @State private var dragOffset: CGSize = .zero
    
    @Binding var textPosition: CGSize
    @Binding var userText: String
    @Binding var fontSize: CGFloat
    @Binding var textColor: Color
    @FocusState private var isTextFieldFocused: Bool
    //    @Binding var textFont: TextFontType
    let containerSize: CGSize
    let textFieldSize: CGSize = CGSize(width: 120, height: 25)

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if isTextFieldFocused {
                    HStack(spacing: 4) {
                        ColorPicker("", selection: $textColor)
                            .labelsHidden()
                            .frame(width: 40)
//                            .padding(.leading)
                        Slider(value: $fontSize, in: 10...20, step: 1)
                            .frame(width: 100)
//                            .padding(.trailing)
                    }
//                    .padding(.top)
                }

                HStack {
                    TextField("Text Something...", text: $userText)
                        .foregroundColor(textColor)
                    //                .font(textFont.font)
                        .font(.system(size: fontSize))
                        .frame(width: textFieldSize.width, height: textFieldSize.height)
                        .offset(x: textPosition.width + dragOffset.width,
                                y: textPosition.height + dragOffset.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    withAnimation(.spring()) {

                                        let newOffset = CGSize(
                                            width: textPosition.width + value.translation.width,
                                            height: textPosition.height + value.translation.height
                                        )
                                        let minX = -containerSize.width / 2 + textFieldSize.width / 2
                                        let maxX = containerSize.width / 2 - textFieldSize.width / 2
                                        let minY = -containerSize.height / 2 + textFieldSize.height / 2
                                        let maxY = containerSize.height / 2 - textFieldSize.height / 2

                                        let clampedX = min(max(newOffset.width, minX), maxX)
                                        let clampedY = min(max(newOffset.height, minY), maxY)

                                        dragOffset = CGSize(width: clampedX - textPosition.width,
                                                            height: clampedY - textPosition.height)

                                    }
                                })
                                .onEnded({ value in
                                    textPosition.width += dragOffset.width
                                    textPosition.height += dragOffset.height
                                    dragOffset = .zero
                                })
                        )
                        .focused($isTextFieldFocused)


                    //                Picker("Font", selection: $textFont) {
                    //                    ForEach(TextFontType.allCases) { fontType in
                    //                        Text(fontType.displayName).tag(fontType)
                    //                    }
                    //                }
                    //                .pickerStyle(SegmentedPickerStyle())

                }
            }
        }

    }
}
//
//#Preview {
//    MainScreenUserCustomTextView(
//        textPosition: .constant(CGSize(width: 0, height: 0)), userText: .constant(" "), containerSize: CGSize(width: 300, height: 300))
//}
