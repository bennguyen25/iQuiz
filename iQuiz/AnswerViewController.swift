//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/12/25.
//

import UIKit

class AnswerViewController: UIViewController {
    
  var question: Question!
  var selectedIndex: Int!
  var isCorrect: Bool!
  var currentIndex: Int!
  var correctCount: Int!
  var totalQuestions: Int!
  var questions: [Question]!
  var quizTitle: String!
    
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var correctAnswerLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var nextButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    questionLabel.text = question.text
    
    let correctText = question.choices[question.correctIndex]
    correctAnswerLabel.text = "Answer: \(correctText)"
    
    resultLabel.text = isCorrect ? "✅ Correct!" : "❌ Wrong"
    
    let moreToGo = currentIndex + 1 < totalQuestions
    nextButton.setTitle(moreToGo ? "Next" : "Finish", for: .normal)
  }
  
  @IBAction func nextTapped(_ sender: UIButton) {
    let moreToGo = currentIndex + 1 < totalQuestions
    if moreToGo {
      performSegue(withIdentifier: "ShowNextQuestionSegue", sender: nil)
    } else {
      performSegue(withIdentifier: "ShowFinishedSegue", sender: nil)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowNextQuestionSegue",
       let qvc = segue.destination as? QuestionViewController {
      qvc.questions      = questions
      qvc.quizTitle      = quizTitle
      qvc.currentQuestionIndex = currentIndex + 1
      qvc.correctCount   = correctCount
    }
    else if segue.identifier == "ShowFinishedSegue",
            let fvc = segue.destination as? FinishedViewController {
      fvc.correctCount    = correctCount
      fvc.totalQuestions  = totalQuestions
    }
  }
}
