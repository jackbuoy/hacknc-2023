//
//  ConfirmedDestination.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI
import MapKit

struct ConfirmedDestination: View {
    var body: some View {
        VStack {
            Map()
                .frame(width: 300, height: 400)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text("Hello")
        }
    }
}

#Preview {
    ConfirmedDestination()
}
