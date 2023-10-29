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
    @State private var dates: Set<DateComponents> = []

  

    @State private var userInput: String = "" // This will store the user's input
    @State private var chatGPTResponse: String = "" // Store the ChatGPT response
    private var vm: Backend = .init()

    var body: some View {
        ZStack {
            Color.darkBlue
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Image(.mountainOnly)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: 200)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
            }
            VStack(spacing: 30) {
                Map()
                    .frame(width: 350, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))

                HStack {
                    Text("What Continent would you like to Explore?")
                        .foregroundStyle(.white)
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
                    .tint(.white)
                    .font(.subheadline)
                }

                MultiDatePicker("Select Time Frame", selection: $dates)


                NavigationLink(destination: {
                    TripSuggestions()
                }, label: {
                    Text("See Suggestions ")
                        .foregroundColor(.darkBlue)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 20)
                        .frame(width: 200)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                })

                //            VStack {
                //                TextField("Enter text here", text: $userInput)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply a rounded border to the text field
                //
                //                Button(action: {
                //                    chatGPTResponse = vm.turnInputintoGPT(stringToGPT: userInput)
                //                    chatGPTResponse = vm.chatGPTResponse()
                //
                //                }, label: {
                //                    Text("Button")
                //                })
                //
                //                Text(chatGPTResponse)
                //                    .padding()
                //            }
            }
        }
    }
}

#Preview {
    RandomDestination()
}
