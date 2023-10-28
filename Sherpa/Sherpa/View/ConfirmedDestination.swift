//
//  ConfirmedDestination.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI
import MapKit

struct ConfirmedDestination: View {
    @State private var userInput: String = "" // This will store the user's input
    var body: some View {
        VStack {
//            Map()
//                .frame(width: 300, height: 400)
//                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            TextField("Enter text here", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply a rounded border to the text field
            NavigationLink(destination: {
                TripSuggestions()
            }, label: {
                Text("See Suggestions ")
                // add clipshape in order to get it to be a rounded Button

            })

        }
    }
}

#Preview {
    ConfirmedDestination()
}
