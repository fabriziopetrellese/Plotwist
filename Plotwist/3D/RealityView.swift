//
//  RealityView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 03/03/22.
//

import SwiftUI
import RealityKit
import FocusEntity

struct RealityView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @State private var isControlsVisible: Bool = true
    @State private var showBrowse: Bool = false
    @State private var showSettings: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            ARViewContainer()
            
            if self.placementSettings.selectedModel == nil {
                ControlView(isControlsVisibile: $isControlsVisible, showBrowse: $showBrowse, showSettings: $showSettings)
            } else {
                PlacementView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable{
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var sessionSettings: SessionSettings
    
    func makeUIView(context: Context) -> CustomARView {
        
        let arView = CustomARView(frame: .zero, sessionSettings: sessionSettings)
        
        //subscriber to sceneevent
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            
            self.updateScene(for: arView)
            
        })
        return arView
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    
    private func updateScene (for arView: CustomARView) {
        
        //only display focus entity when user has selected a model for placement
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        //add model to scene if confirmed for placement
        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            self.place(modelEntity, in: arView)
            self.placementSettings.confirmedModel = nil
        }
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        //1 clone model entityallow multiple assets in a scene
        let clonedEntity = modelEntity.clone(recursive: true)
        
        //2traslation adn rotation
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation], for: clonedEntity)
        
        //3crate an ancorentity and add a clonentity to the ancorentity
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        //4ancorentity to a scene
        arView.scene.addAnchor(anchorEntity)
        
        print ("added model to the scene")
    }
}

struct RealityView_Previews: PreviewProvider {
    static var previews: some View {
        RealityView()
            .environmentObject(PlacementSettings())
            .environmentObject(SessionSettings())
    }
}
