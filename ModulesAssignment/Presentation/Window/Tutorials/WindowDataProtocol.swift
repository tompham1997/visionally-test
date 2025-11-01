//
//  WindowDataProtocol.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import Foundation

protocol WindowDataProtocol: Codable, Hashable {
    associatedtype T
    var windowId: String { get }
    var additionalData: T { get }
}
