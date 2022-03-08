//
//  RealityKitView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 04/03/22.
//

import ARKit
import FocusEntity
import RealityKit
import SwiftUI

struct RealityKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let view = ARView()

        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        session.run(config)

        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        view.addSubview(coachingOverlay)

        #if DEBUG
            // view.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry, .showPhysics]
        #endif

        context.coordinator.view = view
        session.delegate = context.coordinator

        view.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))

        return view
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, ARSessionDelegate {
        weak var view: ARView?
        var focusEntity: FocusEntity?
        var diceEntity: ModelEntity?
        var diceEntity2: ModelEntity?
        var diceEntity3: ModelEntity?

        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
        }

        @objc func handleTap() {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }
            
            // Create a new anchor to add content to
                let anchor = AnchorEntity()
                view.scene.anchors.append(anchor)

            if let diceEntity = self.diceEntity {
                // roll the dice on 2nd tap
                diceEntity.addForce([0, 2, 0], relativeTo: nil)
                diceEntity.addTorque([Float.random(in: 0 ... 0.4), Float.random(in: 0 ... 0.4), Float.random(in: 0 ... 0.4)], relativeTo: nil)
            } else {
                // create the dice on 1st tap
                let anchor = AnchorEntity()
                view.scene.addAnchor(anchor)

                let diceEntity = try! Entity.loadModel(named: "foodDice")
                diceEntity.scale = [0.1, 0.1, 0.1]
//                diceEntity.position = focusEntity.position

                let extent = diceEntity.visualBounds(relativeTo: diceEntity).extents.y
                let boxShape = ShapeResource.generateBox(size: [extent, extent, extent])
                diceEntity.collision = CollisionComponent(shapes: [boxShape])
                diceEntity.physicsBody = PhysicsBodyComponent(
                    massProperties: .init(shape: boxShape, mass: 50),
                    material: nil,
                    mode: .dynamic
                )

                self.diceEntity = diceEntity
                anchor.addChild(diceEntity)
                
                let diceEntity2 = try! Entity.loadModel(named: "foodDice")
                diceEntity2.scale = [0.1, 0.1, 0.1]
//                diceEntity2.position = focusEntity.position
                
                let extent2 = diceEntity2.visualBounds(relativeTo: diceEntity2).extents.y
                let boxShapeB = ShapeResource.generateBox(size: [extent2, extent2, extent2])
                diceEntity2.collision = CollisionComponent(shapes: [boxShapeB])
                diceEntity2.physicsBody = PhysicsBodyComponent(
                    massProperties: .init(shape: boxShapeB, mass: 50),
                    material: nil,
                    mode: .dynamic
                )

                self.diceEntity2 = diceEntity2
                anchor.addChild(diceEntity2)
                
                let diceEntity3 = try! Entity.loadModel(named: "foodDice")
                diceEntity3.scale = [0.1, 0.1, 0.1]
//                diceEntity3.position = focusEntity.position
                
                let extent3 = diceEntity3.visualBounds(relativeTo: diceEntity3).extents.y
                let boxShapeC = ShapeResource.generateBox(size: [extent3, extent3, extent3])
                diceEntity3.collision = CollisionComponent(shapes: [boxShapeC])
                diceEntity3.physicsBody = PhysicsBodyComponent(
                    massProperties: .init(shape: boxShapeC, mass: 50),
                    material: nil,
                    mode: .dynamic
                )

                self.diceEntity3 = diceEntity3
                anchor.addChild(diceEntity3)

                // Create a plane below the dice
                let planeMesh = MeshResource.generatePlane(width: 2, depth: 2)
                let material = SimpleMaterial(color: .init(white: 1.0, alpha: 0.1), isMetallic: false)
                let planeEntity = ModelEntity(mesh: planeMesh, materials: [material])
//                planeEntity.position = focusEntity.position
                planeEntity.physicsBody = PhysicsBodyComponent(massProperties: .default, material: nil, mode: .static)
                planeEntity.collision = CollisionComponent(shapes: [.generateBox(width: 2, height: 0.001, depth: 2)])
//                planeEntity.position = focusEntity.position
                anchor.addChild(planeEntity)
            }
            if let diceEntity2 = self.diceEntity2 {
                // roll the 2nd dice on 2nd tap
                diceEntity2.addForce([0, 2, 0], relativeTo: nil)
                diceEntity2.addTorque([Float.random(in: 0 ... 0.4), Float.random(in: 0 ... 0.4), Float.random(in: 0 ... 0.4)], relativeTo: nil)
            }
            if let diceEntity3 = self.diceEntity3 {
                // roll the 3rd dice on 2nd tap
                diceEntity3.addForce([0, 2, 0], relativeTo: nil)
                diceEntity3.addTorque([Float.random(in: 0 ... 0.4), Float.random(in: 0 ... 0.4), Float.random(in: 0 ... 0.4)], relativeTo: nil)
            }
        }
    }
}
