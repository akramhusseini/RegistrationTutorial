//
//  ContentView.swift
//  RegistrationTutorial
//
//  Created by Akram Husseini on 21/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            RegistrationFormView()
                .navigationTitle("Register")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
