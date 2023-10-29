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
    
    init(){
        loadedData = []
    }

    func sendRequestToOpenAI(city: String, days: Int) {
        let openaiApiKey = "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"

        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            print("Invalid URL")
            return
        }
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(openaiApiKey)"
        ]

        let systemPrompt = [
            "role": "system",
            "content": """
            Given a city, generate an itinerary for the given number of days in the city with morning, afternoon, and evening events. Make sure these events allow me to exlore & enjoy the city. Your output should be in the following JSON format: {"{day_number}": {"morning": {morning_event}, "afternoon": {afternoon_event}, "evening": {evening_event}}} Remember, your output should just be the JSON.
            """
        ]
        
        let userMessage = [
            "role": "user",
            "content": "City: \(city), Days: \(String(days))"
        ]
        
        let requestData: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [systemPrompt, userMessage],
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
