//
//  expressionView.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/17/22.
//

import SwiftUI

struct ExpressionView: View {
    @EnvironmentObject var mathManager : MathManager
    
    var body: some View {
        VStack {
            HStack{
                Text(mathManager.operationSymbol)
                    .bold()
                    .opacity(0)
                    .font(Font.system(size:35))
                Text("\(mathManager.mathModel.term1)")
                    .font(Font.system(size:35))
                    .bold()
            }
            .padding(1)
            HStack{
                Text(mathManager.operationSymbol)
                    .bold()
                    .font(Font.system(size:35))
                Text("\(mathManager.mathModel.term2)")
                    .font(Font.system(size:35))
                    .bold()
            }
            .padding(1)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 90, height: 5, alignment: .center)
                .padding(1)
            Text("\(mathManager.mathModel.yield)")
                .font(Font.system(size:35))
                .bold()
                .opacity(mathManager.answerVisible ? 1.0 : 0.0)
        }
        .padding(1)
    }
}

struct expressionView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressionView()
            .environmentObject(MathManager())
    }
}
