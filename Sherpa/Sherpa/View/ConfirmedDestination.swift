//
//  ConfirmedDestination.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import MapKit
import SwiftUI

struct ConfirmedDestination: View {
    @State private var selectedCity: String = ""
    @State private var startDate = Date.now
    @State private var endDate = Date.now// This will store the user's input
    var body: some View {
        ZStack {
            Color.darkBlue.opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                List {
                    TextField(text: $selectedCity) {
                        Text("Enter Destination")
                    }
                    
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
                    Result()
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
    ConfirmedDestination()
}
