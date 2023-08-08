//
//  ModelEntity + helper.swift
//  PracVisonOS
//
//  Created by Chan Jung on 8/7/23.
//

import Foundation
import RealityKit

extension ModelEntity {
    func addTappable() -> ModelEntity {
        let newModelEntity = self.clone(recursive: true)
        
        // need this to receive input inside realityView
        newModelEntity.components.set(InputTargetComponent())
        
        newModelEntity.generateCollisionShapes(recursive: true)
        return newModelEntity
    }
}
