//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/12/25.
//

import UIKit

class FinishedViewController: UIViewController {
  var correctCount: Int!
  var totalQuestions: Int!

  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var actionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ratio = Double(correctCount) / Double(totalQuestions)
        
        let performanceText: String
        switch ratio {
        case 1.0:
          performanceText = "Perfect!"
        case 0.75...:
          performanceText = "Great job!"
        case 0.5...:
          performanceText = "Not bad!"
        default:
          performanceText = "Keep practicing!"
        }
        
        resultLabel.numberOfLines = 0
        resultLabel.text = """
          \(performanceText)
          You got \(correctCount!) out of \(totalQuestions!) correct.
          """
        
        actionButton.setTitle("Back to Topics", for: .normal)
      }

  @IBAction func actionTapped(_ sender: UIButton) {
    navigationController?.popToRootViewController(animated: true)
  }
}
