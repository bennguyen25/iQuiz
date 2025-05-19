//
//  Question.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/12/25.
//

import Foundation

struct Question: Codable {
    let text: String
    let choices: [String]
    let correctIndex: Int
}
