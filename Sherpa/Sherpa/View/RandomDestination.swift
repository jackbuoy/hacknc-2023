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
    @State private var startDate = Date.now
    @State private var endDate = Date.now
    
    var body: some View {
        ZStack {
            Color.darkBlue.opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                List {
                    Picker("What Continent would you like to explore?", selection: $selectedCountry) {
                        Text("North America").tag(Continent.NorthAmerica)
                        Text("South America").tag(Continent.SouthAmerica)
                        Text("Asia").tag(Continent.Asia)
                        Text("Antartica").tag(Continent.Antarctica)
                        Text("Europe").tag(Continent.Europe)
                        Text("Australia").tag(Continent.Australia)
                        Text("Anywhere").tag(Continent.Anywhere)
                        Text("Africa").tag(Continent.Africa)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.darkBlue)
                    .padding(20)
                    
                    DatePicker("Trip Start", selection: $startDate, displayedComponents: .date)
                        .foregroundStyle(.darkBlue)
                        .tint(.darkBlue)
                        .padding(20)
                   
                    DatePicker("Trip End", selection: $endDate, displayedComponents: .date)
                        .foregroundStyle(.darkBlue)
                        .tint(.darkBlue)
                        .padding(20)
                       
                }
                .scrollContentBackground(.hidden)

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
            }
        }
    }
}

#Preview {
    RandomDestination()
}
