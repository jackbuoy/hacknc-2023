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
            Image(.mountain)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                NavigationLink(destination: {
                    ConfirmedDestination()
                }, label: {
                    Text("I have a destination in mind")
                    // add clipshape in order to get it to be a rounded Button

                })

                NavigationLink(destination: {
                    RandomDestination()
                }, label: {
                    Text("Take me wherever ")
                    // add clipshape in order to get it to be a rounded Button

                })
            }
        }
    }
}

#Preview {
    Screen2()
}
