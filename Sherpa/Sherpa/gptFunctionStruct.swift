//
//  gptFunctionStruct.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import Foundation

struct OpenAIResponse: Codable {
    var id: String?
    var object: String?
    var created: Int?
    var choices: [Choice]
    var usage: Usage?
}

struct Choice: Codable {
    var index: Int?
    var message: [String: String]
    var finish_reason: String?
}


struct Usage: Codable {
    var prompt_tokens: Int?
    var completion_tokens: Int?
    var total_tokens: Int?
}
