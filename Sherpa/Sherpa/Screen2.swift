//
//  Screen2.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct Screen2: View {
    var body: some View {
        VStack {
            NavigationLink(destination: {
                Screen2()
            }, label: {
                Text("I have a destination in mind")
                // add clipshape in order to get it to be a rounded Button

            })

            NavigationLink(destination: {
                Screen2()
            }, label: {
                Text("Take me wherever ")
                // add clipshape in order to get it to be a rounded Button

            })
        }
    }
}

#Preview {
    Screen2()
}
