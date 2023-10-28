//
//  RandomDestination.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import MapKit
import SwiftUI

enum Continent: String, CaseIterable, Identifiable {
    case Asia, Africa = "farm", NorthAmerica = "North America", SouthAmerica = "South America", Antarctica, Europe, Australia, Anywhere
    var id: Self { self }
}

struct RandomDestination: View {
    @State private var selectedCountry: Continent = .Anywhere
    @State private var userInput: String = "" // This will store the user's input
    @State private var chatGPTResponse: String = "" // Store the ChatGPT response

    var body: some View {
        VStack {
            Map()
                .frame(width: 300, height: 400)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

            HStack {
                Text("What Continent would you like to Explore?")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    

                Picker("What Continent", selection: $selectedCountry) {
                    Text("North America").tag(Continent.NorthAmerica)
                    Text("South America").tag(Continent.SouthAmerica)
                    Text("Asia").tag(Continent.Asia)
                    Text("Antartica").tag(Continent.Antarctica)
                    Text("Europe").tag(Continent.Europe)
                    Text("Australia").tag(Continent.Australia)
                    Text("Anywhere").tag(Continent.Anywhere)
                    Text("Africa").tag(Continent.Africa)
                }
                TextField("Enter text here", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply a rounded border to the text field

                Button(action: {
                    sayhello(continent: selectedCountry)
                }, label: {
                    Text("Button")
                })

                
                Button(action: {
                    turnInputintoGPT(stringToGPT: userInput)
                    chatGPTResponse()
                    
                }, label: {
                    Text("Button")
                })

               Text(chatGPTResponse)
                    .padding()
                
            }
        }
    }
}

#Preview {
    RandomDestination()
}
