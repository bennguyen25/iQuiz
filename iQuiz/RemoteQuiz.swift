//
//  RemoteQuiz.swift
//  iQuiz
//
//  Created by Ben Nguyen on 5/14/25.
//

import Foundation

struct RemoteQuiz: Decodable {
  let title: String
  let desc:  String
  let questions: [RemoteQuestion]

  private enum CodingKeys: String, CodingKey {
    case title, desc, questions
  }
}

struct RemoteQuestion: Decodable {
  let text:        String
  let answerIndex: Int
  let answers:     [String]

  private enum CodingKeys: String, CodingKey {
    case text
    case answer
    case answers
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    text        = try c.decode(String.self, forKey: .text)
    let ansStr  = try c.decode(String.self, forKey: .answer)
    answerIndex = (Int(ansStr) ?? 1) - 1
    answers     = try c.decode([String].self, forKey: .answers)
  }
}
