//
//  Preferences.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/31/22.
//

import Foundation

struct Preferences {
    enum Operation: String, CaseIterable, Identifiable {
        case multiply, add
        var id: Self { self }
    }
    
    enum Difficulty: String, CaseIterable, Identifiable {
        case easy, medium, hard
        var id: Self { self }
    }
    
    var operation: Operation
    var difficulty: Difficulty
    var numQuestions: Int
    
    static let standard = Preferences(operation: Operation.multiply, difficulty: Difficulty.easy, numQuestions: 3)
}
