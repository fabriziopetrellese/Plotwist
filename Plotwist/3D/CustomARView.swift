//
//  CustomARView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 03/03/22.
//

import RealityKit
import ARKit
import FocusEntity
import Combine

class CustomARView: ARView {
    
    var focusEntity: FocusEntity?
    var sessionSettings: SessionSettings
    
    private var peopleOcclusionCancellable: AnyCancellable?
    private var objectOcclusionCancellable: AnyCancellable?
    private var lidarDebugCancellable: AnyCancellable?
    private var multiuserCancellable: AnyCancellable?
    
    required init(frame frameRect: CGRect, sessionSettings: SessionSettings) {
        self.sessionSettings = sessionSettings
        
        super.init(frame: frameRect)
        
        focusEntity = FocusEntity(on: self, focus: .classic)
        
        configure()
        
//        self.initializaSettings()
//        
//        self.setupSubscribers()
    }
    
    required init(frame frameRect: CGRect) {
        fatalError("has not been implemented")
    }
    
    @MainActor @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
   
    }
    
    private func configure (){
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        session.run(config)
    }
    
//    private func initializaSettings(){
//        self.updatePeopleOcclusion(isEnable: sessionSettings.isPeopleOcclusionEnabled)
//        self.updateObjectOcclusion(isEnable: sessionSettings.isObjectOcclusionEnabled)
//        self.updateLidarOcclusion(isEnable: sessionSettings.isLidarDebugEnabled)
//        self.updateMultiuser(isEnable: sessionSettings.isMultiuserEnabled)
//    }
//
//    private func setupSubscribers(){
//        self.peopleOcclusionCancellable = sessionSettings.$isPeopleOcclusionEnabled.sink { [weak self] isEnabled in
//            self?.updatePeopleOcclusion(isEnable: isEnabled)
//
//        }
//        self.objectOcclusionCancellable = sessionSettings.$isObjectOcclusionEnabled.sink { [weak self] isEnabled in
//            self?.updateObjectOcclusion(isEnable: isEnabled)
//
//        }
//        self.lidarDebugCancellable = sessionSettings.$isLidarDebugEnabled.sink { [weak self] isEnabled in
//            self?.updateLidarOcclusion(isEnable: isEnabled)
//
//        }
//        self.multiuserCancellable = sessionSettings.$isMultiuserEnabled.sink { [weak self] isEnabled in
//            self?.updateMultiuser(isEnable: isEnabled)
//
//        }
//    }
//
//    private func updatePeopleOcclusion (isEnable: Bool) {
//        print ("\(#file): People occlusion is Enabled \(isEnable)")
//        //check support capabilities for phones
//        guard ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
//            return
//        }
//
//        guard let configuration = self.session.configuration as? ARWorldTrackingConfiguration else {
//            return
//        }
//        //se abilitato disabilita altrimenti abilita
//        if configuration.frameSemantics.contains(.personSegmentationWithDepth) {
//            configuration.frameSemantics.remove(.personSegmentationWithDepth)
//        } else {
//            configuration.frameSemantics.insert(.personSegmentationWithDepth)
//        }
//
//        self.session.run(configuration)
//    }
//
//    private func updateObjectOcclusion (isEnable: Bool) {
//        print ("\(#file): Object occlusion is Enabled \(isEnable)")
//
//        if self.environment.sceneUnderstanding.options.contains(.occlusion){
//            self.environment.sceneUnderstanding.options.remove(.occlusion)
//        } else {
//            self.environment.sceneUnderstanding.options.insert(.occlusion)
//        }
//    }
//
//    private func updateLidarOcclusion (isEnable: Bool) {
//        print ("\(#file): Lidar occlusion is Enabled \(isEnable)")
//
//        if self.debugOptions.contains(.showSceneUnderstanding){
//            self.debugOptions.remove(.showSceneUnderstanding)
//        } else {
//            self.debugOptions.insert(.showSceneUnderstanding)
//        }
//    }
//
//    private func updateMultiuser (isEnable: Bool) {
//        print ("\(#file): Multiuser is Enabled \(isEnable)")
//    }
}
