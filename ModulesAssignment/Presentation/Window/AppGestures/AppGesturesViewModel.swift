//
//  AppGesturesViewModel.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import Foundation
import Observation

@MainActor
@Observable
final class AppGesturesViewModel {
    let gestures: [AppGestureType] = AppGestureType.allCases
    var selectedGesture: AppGestureType?
    
    init(data: GesturesWindowData?) {
        selectedGesture = data?.gesture
    }
}
