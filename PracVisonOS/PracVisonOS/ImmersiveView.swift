//
//  ImmersiveView.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import ARKit
import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(ImmersiveViewModel.self) var viewModel
    
    @Environment(\.openWindow) private var openWindow
    
    //z: front and back
    //y: up and down
    //x: left and right
    let transform = Transform(translation: SIMD3<Float>(x: 0, y: 0.62, z: -1))
    
    var body: some View {
        RealityView { content in
            await viewModel.fetchModelEntities()
            
            let hardcodeAnchorEntity = AnchorEntity(.world(transform: transform.matrix))
            content.add(hardcodeAnchorEntity)
            
            
            for modelEntity in viewModel.modelEntities {
                hardcodeAnchorEntity.addChild(modelEntity.addTappable())
                modelEntity.move(
                    to: Transform(scale: SIMD3(x: 0.1, y: 0.1, z: 0.1),
                                        translation: SIMD3<Float>(-0.05,0.005,0.1)), 
                    relativeTo: hardcodeAnchorEntity)
            }
        }
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({ value in
            let entity = value.entity
            let name = entity.name
            
            self.openWindow(id: ImmersiveID.detailViewId, value: name)
        }))
        .gesture(DragGesture()
            .targetedToAnyEntity()
            .onChanged({ value in
                value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
            }))
    }
}
