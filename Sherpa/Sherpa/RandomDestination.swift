//
//  RandomDestination.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import MapKit
import SwiftUI

enum Continent: String, CaseIterable, Identifiable {
    case Asia, Africa, NorthAmerica = "North America", SouthAmerica = "South America", Antarctica, Europe,  Australia, Anywhere
    var id: Self { self }
}

struct RandomDestination: View {
    @State private var selectedCountry: Continent = .Anywhere

    var body: some View {
        HStack {
            Text("What Continent would you like to Explore?")
                .font(.subheadline)
                .multilineTextAlignment(.center)
            List{
                Picker("What Continent", selection: $selectedCountry) {
                    Text("North America").tag(Continent.NorthAmerica)
                    Text("South America").tag(Continent.SouthAmerica)
                    Text("Asia").tag(Continent.Asia)
                    Text("Antartica").tag(Continent.Antarctica)
                    Text("Europe").tag(Continent.Europe)
                    Text("Australia").tag(Continent.Australia)
                    Text("Anywhere").tag(Continent.Anywhere)
                }
            }
          
        }
    }
}

#Preview {
    RandomDestination()
}
