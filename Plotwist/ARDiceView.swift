//
//  ContentView.swift
//  DiceAR
//
//  Created by Valerio Domenico Conte on 09/03/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ARDiceView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        session.run(config)

        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Dices.loadDiceA1()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ARDiceView_Previews : PreviewProvider {
    static var previews: some View {
        ARDiceView()
    }
}
#endif


