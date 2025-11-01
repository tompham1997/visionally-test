//
//  AppGestureType.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import Foundation

enum AppGestureType: String, CaseIterable, Identifiable, Equatable, Sendable, Hashable {
    case tap
    case pinch
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .tap: "Tap Gesture"
        case .pinch: "Pinch Gesture"
        }
    }
}
