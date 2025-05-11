import SwiftUI

struct MainScreenView: View {

    @StateObject private var viewModel = MainScreenViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    if let image = viewModel.image {
                        ZoomableScrollView {
                            Image(uiImage: image)
                                .resizable()
//                                .scaledToFit()
                                .scaledToFill()
//                                .clipped()
                                .rotationEffect(viewModel.rotationAngle)
                                .frame(width: 250, height: 250)
                                .padding(.horizontal)
                        }
                    } else {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.6)
                            .frame(width: 300, height: 300)
                            .padding(.horizontal)
                    }
                    if viewModel.showUserCurrentTextForTextfield {
                        MainScreenUserCustomTextView( textPosition: $viewModel.textPosition, userText: $viewModel.userCurrentTextForTextField, fontSize: $viewModel.userFontSize, textColor: $viewModel.userTextColor, containerSize: CGSize(width: 270, height: 250))
                    }
                }
                HStack {
                    Button {
                        
                        viewModel.rotateLeft()
                    } label: {
                        MainButtonLabelStyle(symbolName: "rotate.left", label: "Left")
                    }

                    Button {
                        viewModel.rotateRight()
                    } label: {
                        MainButtonLabelStyle(symbolName: "rotate.right", label: "Right")
                    }
                    
                }
                HStack {
                    Button {
                        viewModel.saveImageToUserLibrary()
//                        if let imageUnwrapped = viewModel.image {
//                            viewModel.addMyImage(name: viewModel.imageName, image: imageUnwrapped)
//                        }

                    } label: {
                        MainButtonLabelStyle(symbolName: "square.and.arrow.down.fill",
                                             label: "Save")
                    }
                    Button {
                        viewModel.showCanvasView()
                    } label: {
                        MainButtonLabelStyle(symbolName: "pencil.tip", label: "Draw")
                    }
                    .sheet(isPresented: $viewModel.isCanvasViewSheetPresent, content: {
                        MainCanvasDrawingView(signatureImage: $viewModel.image)
                    })
//                    .alert("Error", isPresented: $viewModel.showCanvasViewAlert) {
//
//                        Button("OK", role: .cancel) { }
//                    } message: {
//                        Text("No photo found")
//                    }
                    Button {
                        viewModel.tapUserCurrentTextButtonForTextfield()
                    } label: {
                        MainButtonLabelStyle(symbolName: "a.square", label: "Add text")
                    }

                }
                HStack {
                    Button {
                        viewModel.source = .camera
                        viewModel.showPhotoPicker()
                    } label: {
                        MainButtonLabelStyle(symbolName: "camera", label: "Camera")
                    }
                    Button {
                        viewModel.source = .library
                        viewModel.showPhotoPicker()
                    } label: {
                        MainButtonLabelStyle(symbolName: "photo", label: "Photo")
                    }
                    Button {
                        viewModel.showSheetShareCheckingImage()
                    } label: {
                        MainButtonLabelStyle(symbolName: "square.and.arrow.up.fill",
                                             label: "Export")
                    }
                    .sheet(isPresented: $viewModel.showSheetShare, content: {
                        if let imageUnwrapped = viewModel.image {
                            ShareSheet(activityItems: [imageUnwrapped])
                        }
                    })

                }
                Spacer()
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 15) {
                        ForEach(PhotoEffect.allCases, id: \.self) { effect in
                            Button(action: {
                                viewModel.applyEffect(effect: effect)
                            }) {
                                VStack {
                                    Circle()
                                        .fill(effect.effectColor)
                                        .frame(width: 55, height: 55)
                                    Text(effect.rawValue.capitalized)
                                        .font(.caption)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .sheet(isPresented: $viewModel.showPicker) {
                ImagePicker(sourceType: viewModel.source == .library ? .photoLibrary : .camera, selectedImage: $viewModel.image)
                    .ignoresSafeArea()
            }
            .alert("Error", isPresented: $viewModel.showCameraAlert, presenting: viewModel.cameraError, actions: { _ in
                Button("OK", role: .cancel) {}
            }, message: { cameraError in
                Text(cameraError.message)
            })
            .navigationTitle("Editor")

            .alert("Error", isPresented: $viewModel.showImageNotExistSheet) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("No photo is found")
            }
        }
    }

}

#Preview {
    NavigationStack {
        MainScreenView()
    }
}
