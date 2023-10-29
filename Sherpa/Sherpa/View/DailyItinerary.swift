//
//  DailyItinerary.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct DailyItinerary: View {
    @State var date = "today"
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 620)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .foregroundColor(Color.white.opacity(0.9))
                .shadow(radius: 4)
            VStack {
                Text("Monday December 25")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.darkBlue)
                
                
                HStack{
                    Text("Morning")
                    Text("Morning Activities")
                }
                HStack{
                    Text("Afternoon")
                    Text("Afternoon Activities")
                }
                HStack{
                    Text("Evening")
                    Text("Evening Activities")
                }
             
    
              
                Image(.sherpaLogo)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaledToFit()
                // insert actual image for the relevant location here, using sherpa logo as a placeholder
            }
        }
    }
}

#Preview {
    DailyItinerary()
}
