//
//  ContentView.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.sherpaLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
            NavigationLink(destination: {
                Screen2()
                    .navigationBarBackButtonHidden(true)
            }, label: {
                Text("Get Started")
                // add clipshape in order to get it to be a rounded Button

            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
