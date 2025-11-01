//
//  AppGestureItemComponent.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import SwiftUI

struct AppGestureItemComponent: View {
    let gesture: AppGestureType
    @Binding var selectedGesture: AppGestureType?
    
    private var isSelected: Bool {
        selectedGesture == gesture
    }
    
    var body: some View {
        Button {
            if isSelected {
                selectedGesture = nil
            } else {
                selectedGesture = gesture
            }
        } label: {
            Text(gesture.title)
                .font(.footnote)
        }
        .frame(width: 128, height: 128)
        .tint(isSelected ? Color.green : Color.clear)
        .buttonStyle(.borderedProminent)

        
    }
}
