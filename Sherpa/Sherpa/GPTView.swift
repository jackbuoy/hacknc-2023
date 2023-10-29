//
//  GPTView.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct GPTView: View {
    @State var response: String = ""
    @State var gptFunction: gptFunction
    // Your OpenAI API Key

    @ViewBuilder
    var body: some View {
        VStack {
            Text("Response from OpenAI:")
            Text(gptFunction.response)
                .padding()
            Button("Send Request to OpenAI") {
                gptFunction.sendRequestToOpenAI()
            }
        }
    }
}

#Preview {
    GPTView(response: "", gptFunction: gptFunction())
}
