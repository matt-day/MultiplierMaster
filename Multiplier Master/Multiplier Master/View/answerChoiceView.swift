//
//  answerChoiceView.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/17/22.
//

import SwiftUI

struct AnswerChoiceView: View {
    @EnvironmentObject var mathManager : MathManager

    var body: some View {
        HStack{
            ForEach(mathManager.mathModel.answerChoices, id: \.self) { choice in
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 65, height: 50, alignment: .center)
                    Button(action: {mathManager.chooseAnswerChoice(choice: choice)}) {
                        Text("\(choice)")
                            .bold()
                            .frame(width: 65, height: 50, alignment: .center)
                    }
                    .disabled(mathManager.questionAnswered)
                }
            }
        }
    }
}

struct answerChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerChoiceView()
    }
}

