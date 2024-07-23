//
//  MultiplierManager.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/20/22.
//

import Foundation
import SwiftUI

class MathManager : ObservableObject {
    @Published var mathModel : MathModel = MathModel()
    
    var shouldDisablePreferencesButton : Bool {playState != .ready}
    
    init() {
        mathModel = MathModel()
    }
    
    private enum State {
        case ready, playing, final
    }
    
    private var playState: State {
        if mathModel.questionNum == 0 {
            return .ready
        } else if mathModel.questionNum == mathModel.preferences.numQuestions {
            return .final
        } else {
            return .playing
        }
    }
    
    @Published var questionAnswered: Bool = true
    @Published var answerVisible: Bool = true
    
    private var totalQuestions : Int { 1 + mathModel.preferences.numQuestions}
    private var currentRound : Int {(mathModel.questionNum+1)}
    
    var operandRange: ClosedRange<Int> {
        if (mathModel.preferences.operation == .multiply) {
            switch mathModel.preferences.difficulty{
            case .easy:
                return 5...10
            case .medium:
                return 7...15
            case .hard:
                return 12...30
            }
        } else {
            switch mathModel.preferences.difficulty{
            case .easy:
                return 5...10
            case .medium:
                return 7...99
            case .hard:
                return 50...999
            }
        }
    }
    
    
    
    var operationSymbol: String {
        if (mathModel.preferences.operation == .multiply) {
            return "x"
        } else {
            return "+"
        }
    }
    
    
    
    func controlGame() {
        switch playState {
        case .ready:
            toggleButtonAbility()
            nextQuestion()
            mathModel.changeNextButton(to: Constants.buttonName.1)
        case .playing:
            toggleButtonAbility()
            nextQuestion()
            if (mathModel.questionNum == mathModel.preferences.numQuestions) {
                mathModel.changeNextButton(to: Constants.buttonName.2)
            }
        case .final:
            
            mathModel.incrementQuestionNum(modulo: totalQuestions)
            gameReset()
        }
    }
    
    
    
    func chooseAnswerChoice(choice: Int) {
        toggleButtonAbility()

        if (choice == mathModel.yield) {
            setQuestionCorrectness(corr: Constants.questionReaction.1)
            mathModel.incrNumberCorrect()
        } else {
            setQuestionCorrectness(corr: Constants.questionReaction.2)
        }
    }

    
    
    private func nextQuestion() {
        mathModel.incrementQuestionNum(modulo: totalQuestions)
        mathModel.changeTerm1(to: Int.random(in: operandRange))
        mathModel.changeTerm2(to: Int.random(in: operandRange))
        mathModel.changeYield()
        mathModel.fillAnswerChoices(yield: mathModel.yield)
    }
    
    
    
    private func toggleButtonAbility() {
        questionAnswered = !questionAnswered
        answerVisible = !answerVisible
    }
    
    
    
    private func setQuestionCorrectness(corr: String) {
        mathModel.changeQuestionCorrectness(to: corr, num: mathModel.questionNum-1)
    }
    
    func gameReset() {
        questionAnswered = true
        answerVisible = true
        
        mathModel.questionNum = 0
        mathModel.numberCorrect = 0
        
        for index in 0..<mathModel.questionCorrectness.count {
            mathModel.questionCorrectness[index] = Constants.questionReaction.0
        }
        
        mathModel.term1 = 0
        mathModel.term2 = 0
        mathModel.yield = 0
        
        mathModel.answerChoices = [0, 0, 0, 0]
        
        mathModel.buttonText = Constants.buttonName.0
    }
    
}
