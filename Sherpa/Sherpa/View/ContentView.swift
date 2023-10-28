//
//  ContentView.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("DarkBlue")
                    .ignoresSafeArea()
                VStack (spacing: 0){
                    Image(.textOnly)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    Image(.mountainOnly)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
                }
                VStack {
                    Spacer()
                    NavigationLink {
                        Screen2()
                    } label: {
                        Button(action: {}, label: {
                            Text("Get Started")
                                .foregroundColor(.darkBlue)
                                .padding(.horizontal, 20)
                                .frame(width: 300)
                        })
                        .tint(.white)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                     
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
