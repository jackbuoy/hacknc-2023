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
                VStack(spacing: 0) {
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
                        Text("Get Started")
                            .foregroundColor(.darkBlue)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 4)
                            .frame(width: 300)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                }
                .navigationBarBackButtonHidden()
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
