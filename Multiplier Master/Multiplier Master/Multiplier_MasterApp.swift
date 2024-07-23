//
//  Multiplier_MasterApp.swift
//  Multiplier Master
//
//  Created by Matt Day on 1/16/22.
//

import SwiftUI

@main
struct Multiplier_MasterApp: App {
    // Has an instance of the view model
    @StateObject var multiplierManager = MathManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Single instance where every subview of this view has access
                .environmentObject(multiplierManager)
        }
    }
}
