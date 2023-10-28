//
//  IndividualTripSuggestion.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct IndividualTripSuggestion: View {
    var location: String
    @State private var offset = CGSize.zero
    @State private var color = Color.blue
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 320, height: 420)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .foregroundColor(color.opacity(0.9))
                .shadow(radius: 4)
            VStack{
                Text("\(location)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                Image(.sherpaLogo)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaledToFit()
                //insert actual image for the relevant location here, using sherpa logo as a placeholder
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(DragGesture()
            .onChanged({ gesture in
                offset = gesture.translation            })
                .onEnded({ _ in
                    
                }))
    }
}

#Preview {
    IndividualTripSuggestion(location: "Mario")
}
