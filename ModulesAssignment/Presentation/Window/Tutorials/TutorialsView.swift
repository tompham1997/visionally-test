//
//  TutorialsView.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 30/10/25.
//

import SwiftUI

struct TutorialsView: View {
    @State private var viewModel: TutorialsViewModel = .init()
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tutorials) { item in
                    TutorialItemComponent(item: item) {
                        openWindow(id: item.windowData.windowId, value: item.windowData)
                    }
                }
            }
        }
        .padding(24)
    }
}
