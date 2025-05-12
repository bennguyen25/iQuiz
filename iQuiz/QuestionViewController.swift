//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/12/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var quizTitle: String!
    var questions: [Question] = []
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var choiceButtons: [UIButton]!
    @IBOutlet weak var submitButton: UIButton!
    
    var currentQuestionIndex = 0
    private var selectedChoiceIndex: Int?
    var correctCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = quizTitle
        submitButton.isEnabled = false
        showCurrentQuestion()
    }
    
    private func showCurrentQuestion() {
        let q = questions[currentQuestionIndex]
        questionLabel.text = q.text
        
        for (i, button) in choiceButtons.enumerated() {
            if i < q.choices.count {
                button.setTitle(q.choices[i], for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
            button.backgroundColor = .clear
        }
        
        selectedChoiceIndex = nil
        submitButton.isEnabled = false
    }
    
    @IBAction func choiceTapped(_ sender: UIButton) {
        guard let idx = choiceButtons.firstIndex(of: sender) else { return }
        selectedChoiceIndex = idx
        
        for btn in choiceButtons { btn.backgroundColor = .clear }
        sender.backgroundColor = UIColor.systemGray4
        
        submitButton.isEnabled = true
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        guard let chosen = selectedChoiceIndex else { return }
        let q = questions[currentQuestionIndex]
        
        if chosen == q.correctIndex {
            correctCount += 1
        }
        
        performSegue(withIdentifier: "ShowAnswerSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAnswerSegue",
           let answerVC = segue.destination as? AnswerViewController {
            
            let q = questions[currentQuestionIndex]
            answerVC.question = q
            answerVC.selectedIndex = selectedChoiceIndex!
            answerVC.isCorrect = (selectedChoiceIndex == q.correctIndex)
            answerVC.currentIndex = currentQuestionIndex
            answerVC.correctCount = correctCount
            answerVC.totalQuestions = questions.count
        }
    }
}
