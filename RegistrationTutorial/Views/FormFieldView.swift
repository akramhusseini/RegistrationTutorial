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

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if isSecure {
                SecureField(title, text: $text)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(error == nil ? Color.gray : Color.red))
                    .keyboardType(keyboardType)
            } else {
                TextField(title, text: $text)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(error == nil ? Color.gray : Color.red))
                    .keyboardType(keyboardType)
                    .onChange(of: text) { newValue in
                        if keyboardType == .numberPad {
                            text = newValue.filter { "0123456789".contains($0) }
                        }
                    }
            }

            if let error = error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
}

struct FormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormFieldView(title: "Full Name", text: .constant(""), error: "This field is required.")
    }
}