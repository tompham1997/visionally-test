//
//  AppImmersivesScene.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import SwiftUI

struct AppImmersivesScene: Scene {
    var body: some Scene {
        
    }
}

private extension AppImmersivesScene {
    var saloryImmersive: some Scene {
        ImmersiveSpace(id: AppImmersiveIDs.salory.rawValue) {
            ImmersiveView()
        }
    }
}
