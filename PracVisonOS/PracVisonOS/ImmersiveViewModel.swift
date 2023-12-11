//
//  ImmersiveViewModel.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import ARKit
import Foundation
import SwiftUI
import RealityKit

@Observable
final class ImmersiveViewModel {
    let session = ARKitSession()
    let worldInfo = WorldTrackingProvider()
    var modelEntities: [ModelEntity] = []
    
    init() {
        
    }
    
    func start() async {
        do {
            try await session.run([worldInfo])
            
            for await update in worldInfo.anchorUpdates {
                switch update.event {
                case .added:
                    print("Anchor position added.")
                case .updated:
                    print("Anchor position updated.")
                case .removed:
                    print("Anchor position now unknown.")
                }
            }
        } catch(let error) {
            print("error starting session: \(error)")
        }
    }
    
    func fetchModelEntities() async {
        do {
//            async let tea_set = try await ModelEntity(named: "tea_set")
//            async let teapot = try await ModelEntity(named: "teapot")
//            async let tv = try await ModelEntity(named: "tv")
            async let guitar = try await ModelEntity(named: "guitar")
//            async let shoe = try await ModelEntity(named: "shoe")
            
            self.modelEntities = try await [
//                tea_set,
//                teapot,
//                tv,
                guitar,
//                shoe
            ]
            
        } catch(let error) {
            print("error happend: \(error.localizedDescription)")
        }
    }
}
