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
            VStack {
                Image(.sherpaLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                NavigationLink {
                    Screen2()
                } label: {
                    Label("GetStarted", systemImage: "folder")
                }
             
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
