//
//  ContentView.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/16/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mathManager : MathManager
    @State private var showPreferences = false
    
    
    var body: some View {
        ZStack{
            Color.purple
            
            VStack{
                HStack {
                    Button(action: {mathManager.gameReset()}) {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:25)
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                    PreferenceButtonView(showPreferences: $showPreferences)
                }
                CorrectnessView()
                ExpressionView()
                AnswerChoiceView()
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 285, height: 50, alignment: .center)
                        .opacity(0.6)
                    Button(action: {mathManager.controlGame()}) {
                        Text(mathManager.mathModel.buttonText)
                            .bold()
                            .font(Font.system(size:25))
                            .frame(width: 285, height: 50, alignment: .center)
                    }
                    .disabled(!mathManager.questionAnswered)
                }
                .padding()
                .sheet(isPresented: $showPreferences, content: {
                                PreferencesView(preferences: $mathManager.mathModel.preferences, showPreferences: $showPreferences)
                            })
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MathManager())
    }
}
