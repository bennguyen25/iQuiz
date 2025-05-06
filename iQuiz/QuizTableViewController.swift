//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/5/25.
//

import UIKit

class QuizTableViewController: UITableViewController {

    let quizzes = [
        Quiz(title: "Mathematics", description: "How good are you at math?", iconName: "math"),
        Quiz(title: "Marvel Super Heroes", description: "Do you know your Marvel heroes?", iconName: "marvel"),
        Quiz(title: "Science", description: "I hope you're good at science!", iconName: "science")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iQuiz"
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
}
