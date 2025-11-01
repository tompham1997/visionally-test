//
//  GesturesWindowData.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import Foundation

struct GesturesWindowData: Codable, Hashable {
    let gesture: AppGestureType?
    
    init(gesture: AppGestureType?) {
        self.gesture = gesture
    }
    
    private enum CodingKeys: String, CodingKey {
        case gesture
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gesture = .init(rawValue: try container.decode(String.self, forKey: .gesture))
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gesture?.rawValue ?? "", forKey: .gesture)
    }
}
