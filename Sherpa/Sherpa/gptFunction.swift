//
//  gptFunction.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import Foundation

class gptFunction {
    public var response: String = ""
    public var loadedData: [OpenAIResponse] = []

    func sendRequestToOpenAI() {
        let openaiApiKey = "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"

        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            print("Invalid URL")
            return
        }
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(openaiApiKey)"
        ]

        let message = [
            "role": "user",
            "content": "Give me a 3 day itinerary for Rome. Return the activities as a json file with an activity for morning, afternoon and evening."
        ]
        let requestData: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [message],
            "temperature": 0.7
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestData, options: [])
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = jsonData
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        DispatchQueue.main.async {
                            do {
                                self.response = responseString
                                print("\(self.response)")
                                let decoder = JSONDecoder()
                                let decoded = try decoder.decode(OpenAIResponse.self, from: data)
                                print(decoded.choices[0].message.values)
                            }
                            catch{
                                print("mf")
                            }
                        }
                    }
                }
            }.resume()
        } catch {
            print("Error creating JSON data: \(error)")
        }
    }
}
