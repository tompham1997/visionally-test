//
//  AppState.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import Foundation
import Observation
import RealityKit

@MainActor
@Observable
final class AppState {
    var tutorialState = TutorialsState()
    var saloryEntity = Entity()
}

@MainActor
@Observable
final class TutorialsState {
    
}
