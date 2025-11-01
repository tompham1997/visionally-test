//
//  AppWindowsScene.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import SwiftUI

struct AppWindowsScene: Scene {
    var body: some Scene {
        mainWindow
        appGesturesWindow
    }
}

private extension AppWindowsScene {
    var mainWindow: some Scene {
        WindowGroup {
            TutorialsView()
        }
    }
    var appGesturesWindow: some Scene {
        WindowGroup(id: AppWindowIDs.gestures.rawValue, for: GesturesTutorialWindowData.self) { data in
            AppGesturesView(data: data.wrappedValue?.additionalData)
        }
    }
}
