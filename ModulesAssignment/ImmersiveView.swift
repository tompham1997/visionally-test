//
//  ImmersiveView.swift
//  ModulesAssignment
//
//  Created by Daniel on 10/28/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(\.appState) private var appState
    
    var body: some View {
        RealityView { content in
            do {
                // Attempt to load the Earth model from RealityKitContent
                let earth = try await Entity(named: "Earth", in: realityKitContentBundle)
                // Position and scale so it's visible in front of the user
                earth.position = [0, 1.2, -1.5]
                earth.scale = [0.5, 0.5, 0.5]
                content.add(earth)
            } catch {
                // Fallback: show a blue sphere if the Earth asset isn't available
                let mesh = MeshResource.generateSphere(radius: 0.5)
                let material = SimpleMaterial(color: .blue, isMetallic: false)
                let sphere = ModelEntity(mesh: mesh, materials: [material])
                sphere.position = [0, 1.2, -1.5]
                content.add(sphere)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
