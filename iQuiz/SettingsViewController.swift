//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/14/25.
//

import UIKit
import Network

class SettingsViewController: UITableViewController {
  @IBOutlet weak var urlTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    let saved = UserDefaults.standard.string(forKey: "dataSourceURL")
      ?? "http://tednewardsandbox.site44.com/questions.json"
    urlTextField.text = saved
  }

  @IBAction func checkNowTapped(_ sender: UIButton) {
    let urlString = urlTextField.text ?? ""
    UserDefaults.standard.set(urlString, forKey: "dataSourceURL")
    downloadQuizzes(from: urlString)
  }

    private func downloadQuizzes(from urlString: String) {
      let monitor = NWPathMonitor()
      monitor.pathUpdateHandler = { path in
        monitor.cancel()
        
        guard path.status == .satisfied else {
          DispatchQueue.main.async {
            self.showAlert(
              title: "Network Unavailable",
              message: "Please check your connection and try again."
            )
          }
          return
        }

        guard let url = URL(string: urlString) else {
          DispatchQueue.main.async {
            self.showAlert(
              title: "Invalid URL",
              message: "“\(urlString)” is not a valid URL."
            )
          }
          return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
          if let err = error {
            DispatchQueue.main.async {
              self.showAlert(
                title: "Download Error",
                message: err.localizedDescription
              )
            }
            return
          }

          guard let data = data else {
            DispatchQueue.main.async {
              self.showAlert(
                title: "Download Error",
                message: "No data received."
              )
            }
            return
          }

          do {
            let remoteQuizzes = try JSONDecoder()
              .decode([RemoteQuiz].self, from: data)

            let assetMap: [String:String] = [
              "Science!":            "science",
              "Marvel Super Heroes": "marvel",
              "Mathematics":         "math"
            ]
            QuizData.quizzes = remoteQuizzes.map { rq in
              let iconName = assetMap[rq.title] ?? "math"
              return Quiz(
                title:       rq.title,
                description: rq.desc,
                iconName:    iconName
              )
            }

            var newQuestions: [String:[Question]] = [:]
            for rq in remoteQuizzes {
              let qs = rq.questions.map { rqQ in
                Question(
                  text:         rqQ.text,
                  choices:      rqQ.answers,
                  correctIndex: rqQ.answerIndex
                )
              }
              newQuestions[rq.title] = qs
            }
            QuizData.questionsByQuizTitle = newQuestions

            DispatchQueue.main.async {
              NotificationCenter.default.post(
                name: .quizzesUpdated,
                object: nil
              )
              self.dismiss(animated: true)
            }
          }
          catch {
            DispatchQueue.main.async {
              self.showAlert(
                title: "Parse Error",
                message: error.localizedDescription
              )
            }
          }
        }
        .resume()
      }
      monitor.start(queue: .global(qos: .background))
    }

  private func showAlert(title: String, message: String) {
    let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
    a.addAction(.init(title: "OK", style: .default))
    present(a, animated: true)
  }
}

