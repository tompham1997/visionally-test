//
//  ModulesAssignmentApp.swift
//  ModulesAssignment
//
//  Created by Daniel on 10/28/25.
//

import SwiftUI

@main
struct ModulesAssignmentApp: App {
    @State private var appState = AppState()
    
    var body: some Scene {
        Group {
           AppWindowsScene()
        }
        .environment(\.appState, appState)
    }
}
