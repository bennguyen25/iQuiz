//
//  QuizData.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/12/25.
//

import Foundation

struct QuizData {
    static let questionsByQuizTitle: [String: [Question]] = [
        "Mathematics": [
            Question(
                text: "What is 2 + 2?",
                choices: ["3", "4", "5", "22"],
                correctIndex: 1
            ),
            Question(
                text: "What is the square root of 9?",
                choices: ["1", "2", "3", "4"],
                correctIndex: 2
            ),
            // …add more math questions…
        ],
        "Marvel Super Heroes": [
            Question(
                text: "Which Avenger is known as the 'God of Thunder'?",
                choices: ["Iron Man", "Thor", "Hulk", "Black Panther"],
                correctIndex: 1
            ),
            Question(
                text: "What is Captain America’s shield made of?",
                choices: ["Adamantium", "Vibranium", "Uru", "Titanium"],
                correctIndex: 1
            ),
            // …add more Marvel questions…
        ],
        "Science": [
            Question(
                text: "What planet is known as the Red Planet?",
                choices: ["Venus", "Mars", "Jupiter", "Saturn"],
                correctIndex: 1
            ),
            Question(
                text: "What is H₂O commonly known as?",
                choices: ["Oxygen", "Hydrogen", "Water", "Salt"],
                correctIndex: 2
            ),
            // …add more science questions…
        ]
    ]
}
