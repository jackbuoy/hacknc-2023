//
//  ConfirmedDestination.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import MapKit
import SwiftUI

struct ConfirmedDestination: View {
    @State private var userInput: String = "" // This will store the user's input
    var body: some View {
        ZStack {
            Color.darkBlue.opacity(0.8)
                .ignoresSafeArea()
            VStack {
                TextField("Enter text here", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                NavigationLink(destination: {
                    TripSuggestions()
                }, label: {
                    Text("See Suggestions ")
                    // add clipshape in order to get it to be a rounded Button

                })
            }
        }
    }
}

#Preview {
    ConfirmedDestination()
}
