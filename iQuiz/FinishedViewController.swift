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
    resultLabel.text = "You got \(correctCount!) of \(totalQuestions!) correct"
    actionButton.setTitle("Back to Topics", for: .normal)
  }

  @IBAction func actionTapped(_ sender: UIButton) {
    navigationController?.popToRootViewController(animated: true)
  }
}
