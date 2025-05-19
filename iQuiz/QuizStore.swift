//
//  QuizStore.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/19/25.
//

import Foundation

private struct QuizStore: Codable {
  let quizzes: [Quiz]
  let questionsByQuizTitle: [String: [Question]]
}

extension QuizData {
  private static let storeFileName = "quizData.json"
  private static var storeURL: URL = {
    let fm = FileManager.default
    let docs = try! fm.url(
      for: .documentDirectory,
      in: .userDomainMask,
      appropriateFor: nil,
      create: true
    )
    return docs.appendingPathComponent(storeFileName)
  }()

  static func saveToDisk() {
    let store = QuizStore(
      quizzes: quizzes,
      questionsByQuizTitle: questionsByQuizTitle
    )
    do {
      let data = try JSONEncoder().encode(store)
      try data.write(to: storeURL, options: .atomic)
    } catch {
      print("Error saving quizzes to disk:", error)
    }
  }

  static func loadFromDisk() {
    do {
      let data = try Data(contentsOf: storeURL)
      let store = try JSONDecoder().decode(QuizStore.self, from: data)
      quizzes = store.quizzes
      questionsByQuizTitle = store.questionsByQuizTitle
    } catch {
      print("No cached quiz data or failed to load:", error)
    }
  }
}
