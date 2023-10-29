//
//  Screen2.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct Screen2: View {
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
            
            VStack(spacing: 90) {
                NavigationLink(destination: {
                    ConfirmedDestination()
                }, label: {
                    Text("I have a destination in mind")
                        .foregroundColor(.darkBlue)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .frame(width: 300)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                })
                
                NavigationLink(destination: {
                    RandomDestination()
                }, label: {
                    HStack {
                        Text("Take Me Wherever ")
                            .foregroundColor(.darkBlue)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            .frame(width: 300)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    
                })
            }
        }
    }
}

#Preview {
    Screen2()
}
