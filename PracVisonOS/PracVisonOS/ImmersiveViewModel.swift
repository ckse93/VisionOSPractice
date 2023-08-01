//
//  ImmersiveViewModel.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import Foundation
import SwiftUI
import RealityKit

@Observable
final class ImmersiveViewModel {
    var modelEntities: [ModelEntity] = []
    
    init() {
        
    }
    
    func fetchModelEntities() async {
        do {
            async let tea_set = try await ModelEntity(named: "tea_set")
            async let teapot = try await ModelEntity(named: "teapot")
            async let tv = try await ModelEntity(named: "tv")
            async let guitar = try await ModelEntity(named: "guitar")
            async let shoe = try await ModelEntity(named: "shoe")
            
            self.modelEntities = await try [tea_set, teapot, tv, guitar, shoe]
            
        } catch(let error) {
            print("error happend: \(error.localizedDescription)")
        }
    }
}
