//
//  Itinerary.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct Itinerary: View {
    @State var days = 3
    var body: some View {
        ZStack {
            Color.darkBlue.opacity(0.7)
                .ignoresSafeArea()

            TabView {
                ForEach(0..<days){_ in
                    DailyItinerary()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

#Preview {
    Itinerary()
}
