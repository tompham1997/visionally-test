//
//  TutorialItem.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 30/10/25.
//

import SwiftUI






struct Tutorial: Identifiable {
    let id: String
    let title: String
    let description: String
    let windowData: any WindowDataProtocol
}

struct TutorialItemComponent: View {
    let item: Tutorial
    let action: () -> Void
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.headline)
            Text(item.description)
                .font(.body)
            
            Button(action: action) {
                Text("Try it now")
            }

        }
    }
}

