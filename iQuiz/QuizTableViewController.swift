//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/5/25.
//

import UIKit

class QuizTableViewController: UITableViewController {

    var quizzes: [Quiz] {
      return QuizData.quizzes
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      title = "iQuiz"
      QuizData.loadFromDisk()
      NotificationCenter.default.addObserver(
        self,
        selector: #selector(quizzesUpdated),
        name: .quizzesUpdated,
        object: nil
      )
    }
    
    @objc private func quizzesUpdated() {
      tableView.reloadData()
    }
    
    @IBAction func settingsTapped(_ sender: UIBarButtonItem) {
      let alert = UIAlertController(
        title: nil,
        message: "Settings go here",
        preferredStyle: .alert
      )
      alert.addAction(.init(title: "OK", style: .default))
      present(alert, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        let quiz = quizzes[indexPath.row]

        cell.textLabel?.text = quiz.title
        cell.detailTextLabel?.text = quiz.description
        cell.imageView?.image = UIImage(named: quiz.iconName)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "ShowQuestionsSegue",
         let dest = segue.destination as? QuestionViewController,
         let indexPath = tableView.indexPathForSelectedRow {
         let selectedQuiz = quizzes[indexPath.row]
         dest.quizTitle = selectedQuiz.title
         dest.questions = QuizData.questionsByQuizTitle[selectedQuiz.title] ?? []
      }
    }
}

extension Notification.Name {
  static let quizzesUpdated = Notification.Name("quizzesUpdated")
}
