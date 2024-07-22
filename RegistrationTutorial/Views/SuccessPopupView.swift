//
//  SuccessPopupView.swift
//  RegistrationTutorial
//
//  Created by Akram Husseini on 21/07/2024.
//

import SwiftUI

struct SuccessPopupView: View {
    @Binding var showPopup: Bool
    @Environment(\.colorScheme) var colorScheme // Detect the current color scheme
    
    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 16) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                
                Text("Registration Successful!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text("Your registration request has been submitted successfully. You will receive a confirmation soon.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.primary)

                Button(action: {
                    withAnimation {
                        showPopup = false
                    }
                }) {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color(uiColor: .systemBackground))
            .cornerRadius(12)
            .shadow(color: shadowColor, radius: 10)
            .padding(.horizontal, 40)
            .transition(.scale) // Scale transition for appearance and disappearance
            Spacer()
        }
        .background(Color.black.opacity(0.6).edgesIgnoringSafeArea(.all))
    }
    
    // Computed property to determine shadow color based on color scheme
       private var shadowColor: Color {
           colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.2)
       }
}

struct SuccessPopupView_Previews: PreviewProvider {
    @State static var showPopup = true
    
    static var previews: some View {
        SuccessPopupView(showPopup: $showPopup)
    }
}
