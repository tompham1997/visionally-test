//
//  AppImmersivesScene.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import SwiftUI

struct AppImmersivesScene: Scene {
    var body: some Scene {
        saloryImmersive
    }
}

private extension AppImmersivesScene {
    var saloryImmersive: some Scene {
        ImmersiveSpace {
            SalloryImmersiveView()
        }
    }
}
