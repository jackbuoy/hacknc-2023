//
//  Backend.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import Foundation

@State public var tempString: tempString = ""


func sayhello(continent: Continent) {
    
    print("Hello \(continent)")
    print("\(continent.rawValue)")
}

func turnInputintoGPT(stringToGPT: userInput) -> String{
    let newString = ("Make me an itinerary schedule for \(stringToGPT.rawValue)")
    tempString = newString
    return newString
}

import OpenAI

// Initialize the OpenAI instance with your API key
let openAI = OpenAI(apiToken: "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")

// Define your prompt
// let prompt = tempString

// Create a CompletionsQuery with the prompt
let query = CompletionsQuery(model: .davinci, prompt: tempString)

// Send the request to ChatGPT
func chatGPTResponse() {
    openAI.completions.create(query: query) { result in
        switch result {
        case .success(let response):
            // Handle the successful response
            let completionText = response.choices.first?.text ?? "No response"
            DispatchQueue.main.async {
                chatGPTResponse = "ChatGPT Response: \(completionText)"
            }
        case .failure(let error):
            // Handle the error
            print("Error: \(error)")
        }
    }
}

