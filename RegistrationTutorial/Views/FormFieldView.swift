//
//  FormFieldView.swift
//  RegistrationTutorial
//
//  Created by Akram Husseini on 21/07/2024.
//

import SwiftUI

struct FormFieldView: View {
    let title: String
    @Binding var text: String
    var error: String?
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var type: fieldId
    var isFocused: Bool
    
    var body: some View {
        let borderColor = isFocused ? Color.blue : (error == nil ? Color.gray : Color.red)
        VStack(alignment: .leading, spacing: 4) {
            if isSecure {
                SecureField(title, text: $text)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(borderColor))
                    .keyboardType(keyboardType)
            } else {
                TextField(title, text: $text)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(borderColor))
                    .keyboardType(keyboardType)
                    .onChange(of: text) { newValue in
                        switch type {
                        case .phone:
                            text = newValue.filter { "0123456789".contains($0) }
                        case .name:
                            text = newValue.filter { ("a"..."z").contains($0) || ("A"..."Z").contains($0) }
                        default: break
                            
                        }
                    }
            }

            if let error = error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.3), value: error)
            }
        }
        .padding(.bottom, 8)
    }
}

struct FormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormFieldView(title: "Full Name", text: .constant(""), error: "This field is required.", type: .name, isFocused: true)
    }
}
