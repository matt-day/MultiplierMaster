//
//  correctnessView.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/16/22.
//

import SwiftUI

struct CorrectnessView: View {
    @EnvironmentObject var mathManager : MathManager

    var body: some View {
        VStack{
            Text("Question \(mathManager.mathModel.questionNum)")
                .font(Font.system(size:25))
                .foregroundColor(.green)
                .bold()
                .underline()
            HStack{
                ForEach(mathManager.mathModel.questionCorrectness, id: \.self) { corr in
                    Text(corr)
                }
            }
                .padding(5)
            Text("\(mathManager.mathModel.numberCorrect)/\(mathManager.mathModel.preferences.numQuestions)")
                .font(Font.system(size:18))
                .foregroundColor(.green)
        }
    }
}

struct correctnessView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectnessView()
            .environmentObject(MathManager())
    }
}
