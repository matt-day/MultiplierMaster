//
//  PreferenceButtonView.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/31/22.
//

import SwiftUI

struct PreferenceButtonView: View {
    @EnvironmentObject var mathManager : MathManager
    @Binding var showPreferences : Bool
    
    let size : CGFloat = 25
    var body: some View {
        Button(action: {showPreferences.toggle()}) {
            Image(systemName: "gearshape")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:size)
                .foregroundColor(.black)
                .padding()
        }
        .disabled(mathManager.shouldDisablePreferencesButton)
    }
}

struct PreferenceButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceButtonView( showPreferences: .constant(true)).environmentObject(MathManager())
    }
}
