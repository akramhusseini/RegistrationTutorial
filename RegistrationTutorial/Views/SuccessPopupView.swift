//
//  SuccessPopupView.swift
//  RegistrationTutorial
//
//  Created by Akram Husseini on 21/07/2024.
//

import SwiftUI

struct SuccessPopupView: View {
    @Binding var showPopup: Bool

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

                Text("Your registration request has been submitted successfully. You will receive a confirmation soon.")
                    .multilineTextAlignment(.center)
                    .padding()

                Button(action: {
                    showPopup = false
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
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 10)
            .padding(.horizontal, 40)

            Spacer()
        }
        .background(Color.black.opacity(0.6).edgesIgnoringSafeArea(.all))
    }
}

struct SuccessPopupView_Previews: PreviewProvider {
    @State static var showPopup = true
    
    static var previews: some View {
        SuccessPopupView(showPopup: $showPopup)
    }
}
