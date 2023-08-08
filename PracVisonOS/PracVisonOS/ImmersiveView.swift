//
//  ImmersiveView.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Bindable var viewModel: ImmersiveViewModel
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        RealityView { content in
            await viewModel.fetchModelEntities()
            
            for modelEntity in viewModel.modelEntities {
                content.add(modelEntity)
            }
        }
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({ value in
            let entity = value.entity
            let name = entity.name
            
            self.openWindow(id: ImmersiveID.detailViewId, value: name)
        }))
    }
}
