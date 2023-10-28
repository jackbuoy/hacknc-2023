//
//  TripSuggestions.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct TripSuggestions: View {
    private var suggestions: [IndividualTripSuggestion] = []
    
    private var sample: [String] = ["Peach", "trip", "mario", "shout"]
    
    var body: some View {
        VStack{
            ZStack{
                ForEach(sample, id: \.self){ person in
                    IndividualTripSuggestion(location: person) 
                    
                }
            }
        }
    }
}

#Preview {
    TripSuggestions()
}
