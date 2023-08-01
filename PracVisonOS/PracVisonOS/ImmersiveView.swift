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
    
    var body: some View {
        RealityView { content in
            await viewModel.fetchModelEntities()
            
            for modelEntity in viewModel.modelEntities {
                content.add(modelEntity)
            }
        }
    }
}
