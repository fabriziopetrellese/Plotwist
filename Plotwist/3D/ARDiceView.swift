//
//  ContentView.swift
//  DiceAR
//
//  Created by Valerio Domenico Conte on 09/03/22.
//

import SwiftUI
import RealityKit

struct ARDiceView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var categoriesModel: CategoriesModel
        
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
      
        arView.renderOptions = [.disableMotionBlur,
                                .disableDepthOfField,
                                .disablePersonOcclusion,
                                .disableGroundingShadows,
                                .disableFaceMesh,
                                .disableHDR]
   
        switch categoriesModel.selectedCategory {
        case 1:
            let boxAnchor = try! Experience.loadVideogames()
            arView.scene.anchors.append(boxAnchor)
            
        case 2:
            let boxAnchor = try! Experience.loadTravel()
            arView.scene.anchors.append(boxAnchor)
            
        case 3:
            let boxAnchor = try! Experience.loadAnimals()
            arView.scene.anchors.append(boxAnchor)

        case 4:
            let boxAnchor = try! Experience.loadFood()
            arView.scene.anchors.append(boxAnchor)
            
        case 5:
            let boxAnchor = try! Experience.loadEmotions()
            arView.scene.anchors.append(boxAnchor)
            
        case 6:
            let boxAnchor = try! Experience.loadSports()
            arView.scene.anchors.append(boxAnchor)
            
        default:
            print("ERROR")
        }
                
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ARDiceView_Previews : PreviewProvider {
    static var previews: some View {
        ARDiceView()
            .environmentObject(CategoriesModel())
    }
}
#endif


/*
 import ARKit
 
 ////////////////////////////////////////////////////////////////////
 
 let session = arView.session
 let config = ARWorldTrackingConfiguration()
 config.planeDetection = .horizontal
 session.run(config)

 let coachingOverlay = ARCoachingOverlayView()
 coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
 coachingOverlay.session = session
 coachingOverlay.goal = .horizontalPlane
 arView.addSubview(coachingOverlay)
 */
