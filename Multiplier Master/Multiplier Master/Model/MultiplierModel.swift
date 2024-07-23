//
//  MultiplierModel.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/20/22.
//

import Foundation
import SwiftUI

struct MathModel {
    
    var preferences: Preferences

    var questionCorrectness : [String] = []
    
    var term1: Int
    var term2: Int
    var yield: Int
    var answerChoices: Array<Int>
    
    var buttonText: String
    var questionNum = 0
    var numberCorrect = 0
    
    init() {
        preferences = Preferences.standard
        for _ in (0..<preferences.numQuestions){
            questionCorrectness.append(Constants.questionReaction.0)
        }
        
        term1 = 0
        term2 = 0
        yield = 0
        
        answerChoices = [0, 0, 0, 0]
        
        buttonText = Constants.buttonName.0
    }
    
    mutating func updateQuestionCorrectness() {
        questionCorrectness = [String](repeating: Constants.questionReaction.0, count: preferences.numQuestions)
    }
    
    mutating func changeQuestionCorrectness(to name: String, num: Int) {
        questionCorrectness[num] = name
    }
    
    mutating func incrementQuestionNum(modulo modulus: Int) {
        questionNum = (questionNum + 1) % modulus
    }
    
    mutating func changeNextButton(to name: String) {
        buttonText = name
    }
    
    mutating func changeTerm1(to num: Int) {
        term1 = num
    }
    
    mutating func changeTerm2(to num: Int) {
        term2 = num
    }
    
    mutating func changeYield() {
        if (preferences.operation == .multiply) {
            yield = term2*term1
        } else {
            yield = term2+term1
        }
    }
    
    mutating func incrNumberCorrect() {
        numberCorrect += 1
    }
    
    mutating func fillAnswerChoices(yield: Int) {
        answerChoices = [0, 0, 0, 0]
        answerChoices[0] = yield
        var i = 1
        while i < 4 {
            let newNum = Int.random(in: (yield-5)...(yield+5))
            if (!answerChoices.contains(newNum)) {
                answerChoices[i] = newNum
                i += 1
            }
        }
        answerChoices.shuffle()
    }

}
