//
//  RegistrationFormView.swift
//  RegistrationTutorial
//
//  Created by Akram Husseini on 21/07/2024.
//

import SwiftUI

struct RegistrationFormView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var showSuccessPopup = false
    @FocusState private var focusedField: fieldId?
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    FormFieldView(
                        title: "Full Name",
                        text: $viewModel.fullName,
                        error: viewModel.fullNameError,
                        type: .name,
                        isFocused: focusedField == .name)
                    .focused($focusedField, equals: .name)
                    FormFieldView(
                        title: "Phone Number",
                        text: $viewModel.phoneNumber,
                        error: viewModel.phoneNumberError,
                        keyboardType: .numberPad,
                        type: .phone,
                        isFocused: focusedField == .phone)
                    .focused($focusedField, equals: .phone)
                    FormFieldView(
                        title: "Email",
                        text: $viewModel.email,
                        error: viewModel.emailError,
                        type: .email,
                        isFocused: focusedField == .email)
                    .focused($focusedField, equals: .email)
                    FormFieldView(
                        title: "Password",
                        text: $viewModel.password,
                        error: viewModel.passwordError,
                        isSecure: true,
                        type: .password,
                        isFocused: focusedField == .password)
                    .focused($focusedField, equals: .password)
                    Button(action: {
                        UIApplication.shared.endEditing() // Close the keyboard
                        viewModel.validateAndSubmit()
                        if viewModel.isFormValid {
                            withAnimation {
                                showSuccessPopup = true
                            }
                        }
                    }) {
                        Text("Create Account")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.canAttemptRegister ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(!viewModel.canAttemptRegister)
                    
                    Spacer()
                }
                .padding(16.0)
            }
          
            .onChange(of: viewModel.fullName) { _ in viewModel.liveValidate() }
            .onChange(of: viewModel.phoneNumber) { _ in viewModel.liveValidate() }
            .onChange(of: viewModel.email) { _ in viewModel.liveValidate() }
            .onChange(of: viewModel.password) { _ in viewModel.liveValidate() }
            
            if showSuccessPopup {
                SuccessPopupView(showPopup: $showSuccessPopup)
            }
        }
    }
}

struct RegistrationFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationFormView()
    }
}

