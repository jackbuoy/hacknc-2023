//
//  Backend.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import Foundation
import OpenAI

class Backend: ObservableObject {
    var tempString: String = ""
    
    func sayhello(continent: Continent) {
        print("Hello \(continent)")
        print("\(continent.rawValue)")
    }
    
    func turnInputintoGPT(stringToGPT: String) -> String {
        let newString = "Make me an itinerary schedule for \(stringToGPT)"
        tempString = newString
        return newString
    }
    
    // Initialize the OpenAI instance with your API key
    let openAI = OpenAI(apiToken: "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")
    
    // Define your prompt
    // let prompt = tempString
    
    // Create a CompletionsQuery with the prompt
    let query = CompletionsQuery(model: .davinci, prompt: "tempString")
    
    // Send the request to ChatGPT
    func chatGPTResponse() -> String {
        // Define your prompt here
        let prompt = tempString

        // Create a CompletionsQuery with the prompt
        let query = CompletionsQuery(model: .davinci, prompt: prompt)
        
       openAI.completions(query: query) { result in
            switch result {
            case .success(let response):
                // Handle the successful response
                let completionText = response.choices.first?.text ?? "No response"
                DispatchQueue.main.async {
                    // Assign the result to your observable object property
                    self.tempString = "ChatGPT Response: \(completionText)"
                }
            case .failure(let error):
                // Handle the error
                print("Error: \(error)")
            }
        }
        
        return tempString 
    }
}
