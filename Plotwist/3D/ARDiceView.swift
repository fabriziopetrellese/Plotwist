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
    var diceName: LocalizedStringKey
    
    var body: some View {
        return ARViewContainer(diceName: diceName).edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var categoriesModel: CategoriesModel
    var diceName: LocalizedStringKey
    
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
        
        if categoriesModel.selectCategory(category: diceName) == 1 {
            let boxAnchor = try! Experience.loadVideogames()
            arView.scene.anchors.append(boxAnchor)
        }
        if categoriesModel.selectCategory(category: diceName) == 2 {
            let boxAnchor = try! Experience.loadTravel()
            arView.scene.anchors.append(boxAnchor)
        }
        if categoriesModel.selectCategory(category: diceName) == 3 {
            let boxAnchor = try! Experience.loadAnimals()
            arView.scene.anchors.append(boxAnchor)
        }
        if categoriesModel.selectCategory(category: diceName) == 4 {
            let boxAnchor = try! Experience.loadFood()
            arView.scene.anchors.append(boxAnchor)
        }
        if categoriesModel.selectCategory(category: diceName) == 5 {
            let boxAnchor = try! Experience.loadEmotions()
            arView.scene.anchors.append(boxAnchor)
        }
        if categoriesModel.selectCategory(category: diceName) == 6 {
            let boxAnchor = try! Experience.loadSports()
            arView.scene.anchors.append(boxAnchor)
        }
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ARDiceView_Previews : PreviewProvider {
    static var previews: some View {
        ARDiceView(diceName: "")
            .environmentObject(CategoriesModel())
    }
}
#endif
