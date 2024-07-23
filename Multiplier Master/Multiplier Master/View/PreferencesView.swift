//
//  PreferencesView.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/31/22.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var mathManager : MathManager
    @Binding var preferences : Preferences
    @Binding var showPreferences : Bool
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Operation")) {
                    Picker("Operation", selection: $preferences.operation) {
                        ForEach(Preferences.Operation.allCases) { operation in
                                        Text(operation.rawValue)
                                    }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Difficulty")) {
                    Picker("Difficulty", selection: $preferences.difficulty) {
                        ForEach(Preferences.Difficulty.allCases) { difficulty in
                                        Text(difficulty.rawValue)
                                    }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Number of Questions")) {
                    Stepper(value: $preferences.numQuestions, in: Constants.numQuestionsRange) {
                        Text("\(preferences.numQuestions)")
                    }
                }
                Section() {
                    HStack {
                        Spacer()
                        
                        Button(action: {showPreferences.toggle()
                            mathManager.mathModel.updateQuestionCorrectness()
                        }, label: {
                            Text("Dismiss")
                        })
                        Spacer()
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(preferences: .constant(Preferences.standard), showPreferences: .constant(true))
    }
}
