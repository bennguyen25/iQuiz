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
            Question(
                text: "If x⁴ = 16, what is x?",
                choices: ["±2", "2 only", "±4", "4 only"],
                correctIndex: 0
            ),
            Question(
                text: "What is the next prime after 7?",
                choices: ["9", "11", "10", "13"],
                correctIndex: 1
            ),
            Question(
                text: "What is 15% of 200?",
                choices: ["20", "30", "25", "15"],
                correctIndex: 1
            ),
            Question(
                text: "Solve for x: 3x – 5 = 16",
                choices: ["7", "3.67", "5.67", "21"],
                correctIndex: 0
            )
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
            Question(
                text: "Who is the ruler of Wakanda?",
                choices: ["Shuri", "T’Challa", "M’Baku", "Okoye"],
                correctIndex: 1
            ),
            Question(
                text: "Which hero wields the Infinity Gauntlet in the climactic battle?",
                choices: ["Thanos", "Iron Man", "Captain Marvel", "Doctor Strange"],
                correctIndex: 1
            ),
            Question(
                text: "Peter Parker works as a photographer for which newspaper?",
                choices: ["The Daily Bugle", "The Daily Planet", "New York Daily", "The Bugle Bee"],
                correctIndex: 0
            ),
            Question(
                text: "What metal is Wolverine’s skeleton bonded with?",
                choices: ["Steel", "Titanium", "Adamantium", "Vibranium"],
                correctIndex: 2
            )
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
            Question(
                text: "What gas do plants absorb from the atmosphere?",
                choices: ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
                correctIndex: 1
            ),
            Question(
                text: "At what temperature (°C) does water boil at sea level?",
                choices: ["90", "95", "100", "105"],
                correctIndex: 2
            ),
            Question(
                text: "What force keeps us grounded on Earth?",
                choices: ["Magnetism", "Friction", "Gravity", "Buoyancy"],
                correctIndex: 2
            ),
            Question(
                text: "What is the chemical symbol for table salt?",
                choices: ["NaCl", "KCl", "NaCO₃", "CaCl₂"],
                correctIndex: 0
            )
        ]
    ]
}
