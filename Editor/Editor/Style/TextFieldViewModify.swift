//
//  TextFieldViewModify.swift
//  Editor
//
//  Created by Язгуль Хасаншина on 11.05.2025.
//

import SwiftUI
struct TextFieldViewModify: ViewModifier {
    @Binding var text: String
    var disabled: Bool = false

    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                        .opacity(0.7)
                }
                .disabled(disabled)
                .transition(.opacity)
            }
        }
    }

}

extension View {
    func clearTextField(text: Binding<String>, disabled: Bool = false) -> some View {
        self.modifier(TextFieldViewModify(text: text, disabled: disabled))
    }
}
