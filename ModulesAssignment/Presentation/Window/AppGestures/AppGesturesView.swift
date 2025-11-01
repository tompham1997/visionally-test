//
//  AppGesturesView.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import SwiftUI

struct AppGesturesView: View {
    @Environment(\.appState) private var appState
    @State private var viewModel: AppGesturesViewModel
    
    init(data: GesturesWindowData? = nil) {
        viewModel = AppGesturesViewModel(data: data)
    }
    
    var body: some View {
        HStack {
            ForEach(viewModel.gestures) { gesture in
                AppGestureItemComponent(
                    gesture: gesture,
                    selectedGesture: $viewModel.selectedGesture
                )
            }
        }
    }
}
