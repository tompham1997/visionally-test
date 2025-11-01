//
//  SalloryImmersiveView.swift
//  ModulesAssignment
//
//  Created by Tom Pham on 1/11/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SalloryImmersiveView: View {
    @Environment(\.appState) private var appState
    @State private var tapSubscription: EventSubscription? = nil
    
    var body: some View {
        RealityView { content in
            do {
                // Create a parent solar system root so we can position everything together
                let solarSystemRoot = Entity()
                solarSystemRoot.position = [0, 1.2, -1.5]

                // Sun (unlit so it appears bright)
                let sunMesh = MeshResource.generateSphere(radius: 0.2)
                let sunMaterial = UnlitMaterial(color: .yellow)
                let sun = ModelEntity(mesh: sunMesh, materials: [sunMaterial])
                solarSystemRoot.addChild(sun)

                // Helper to create a colored planet sphere
                func makePlanet(color: UIColor, radius: Float, xOffset: Float) -> ModelEntity {
                    let mesh = MeshResource.generateSphere(radius: radius)
                    let material = SimpleMaterial(color: color, isMetallic: false)
                    let planet = ModelEntity(mesh: mesh, materials: [material])
                    planet.position = [xOffset, 0, 0]
                    return planet
                }

                // Mercury
                let mercury = makePlanet(color: .lightGray, radius: 0.03, xOffset: 0.30)
                solarSystemRoot.addChild(mercury)

                // Venus
                let venus = makePlanet(color: .orange, radius: 0.08, xOffset: 0.45)
                solarSystemRoot.addChild(venus)

                // Earth: try to load a detailed model; if it fails, fall back to a sphere
                let earthParent = Entity()
                earthParent.position = [0.60, 0, 0]

                if let earth = try? await Entity(named: "Earth", in: realityKitContentBundle) {
                    earth.scale = [0.5, 0.5, 0.5]
                    // Enable tap interactions on the Earth entity
                    earth.components.set(InputTargetComponent())
                    earthParent.addChild(earth)

                    // Subscribe to tap gestures on the Earth entity
//                    self.tapSubscription = content.subscribe(to: GestureEvents.Tap.self, on: earth) { _ in
//                        var t = earth.transform
//                        t.scale *= 1.1
//                        earth.move(to: t, relativeTo: nil, duration: 0.2, timingFunction: .easeInOut)
//                    }
                } else {
                    let earthFallback = makePlanet(color: .blue, radius: 0.09, xOffset: 0.0)
                    // Enable tap interactions on the fallback Earth sphere
                    earthFallback.components.set(InputTargetComponent())

                    // Subscribe to tap gestures on the fallback Earth
//                    self.tapSubscription = content.subscribe(to: GestureEvents.Tap.self, on: earthFallback) { _ in
//                        var t = earthFallback.transform
//                        t.scale *= 1.1
//                        earthFallback.move(to: t, relativeTo: nil, duration: 0.2, timingFunction: .easeInOut)
//                    }
                    earthParent.addChild(earthFallback)
                }
                solarSystemRoot.addChild(earthParent)

                // Mars
                let mars = makePlanet(color: .red, radius: 0.06, xOffset: 0.80)
                solarSystemRoot.addChild(mars)

                // Add the whole system to the scene
                content.add(solarSystemRoot)
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
