//
//  UIApplication.swift
//  RegistrationTutorial
//
//  Created by Akram Husseini on 22/07/2024.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
