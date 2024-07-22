//
//  RegistrationViewModel.swift
//  RegistrationTutorial
//
//  Created by Akram Husseini on 21/07/2024.
//

import SwiftUI
import Combine

class RegistrationViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var fullNameError: String?
    @Published var phoneNumberError: String?
    @Published var emailError: String?
    @Published var passwordError: String?
    
    var canAttemptRegister: Bool {
        return !phoneNumber.isEmpty && !fullName.isEmpty && !email.isEmpty && !password.isEmpty
    }
    
    var isFormValid: Bool {
        return fullNameError == nil && phoneNumberError == nil && emailError == nil && passwordError == nil
    }
    
    func liveValidate() {
        // This function only validates whether the button should be enabled or not.
        // It doesn't reset the error messages.
    }
    
    func validateAndSubmit() {
        withAnimation {
            fullNameError = fullName.isEmpty ? "Full Name is required" : nil
            phoneNumberError = validatePhoneNumber(phoneNumber)
            emailError = validateEmail(email)
            passwordError = validatePassword(password)
        }
    }
    
    func validatePhoneNumber(_ phoneNumber: String) -> String? {
        let phoneRegex = "^05[0-9]{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phoneNumber.isEmpty {
            return "Phone Number is required"
        } else if !phoneTest.evaluate(with: phoneNumber) {
            return "Invalid phone number. It must start with 05 and be 10 digits long."
        }
        return nil
    }
    
    func validateEmail(_ email: String) -> String? {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        if email.isEmpty {
            return "Email is required"
        } else if !emailPredicate.evaluate(with: email) {
            return "Invalid email address."
        }
        return nil
    }

    func validatePassword(_ password: String) -> String? {
        if password.isEmpty {
            return "Password is required"
        } else if password.count < 6 {
            return "Password must be at least 6 characters long."
        }
        return nil
    }
}
