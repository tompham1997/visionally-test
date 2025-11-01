//
//  GesturesTutorialWindowData.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import Foundation

struct GesturesTutorialWindowData: WindowDataProtocol {
    let windowId: String = AppWindowIDs.gestures.rawValue
    let additionalData: GesturesWindowData
    
    init(additionalData: GesturesWindowData) {
        self.additionalData = additionalData
    }
    
    private enum CodingKeys: String, CodingKey {
        case additionalData
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        additionalData = try container.decode(GesturesWindowData.self, forKey: .additionalData)
    }
}
