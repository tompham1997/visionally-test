//
//  TutorialsViewModel.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import Foundation
import Observation

@MainActor
@Observable
final class TutorialsViewModel {
    var tutorials: [Tutorial] = [
        Tutorial(
            id: "1",
            title: "Gestures",
            description: "Supporting Gesturs",
            windowData: GesturesTutorialWindowData(
                additionalData: .init(gesture: .tap)
            )
        )
    ]
}
