//
//  PracVisonOSApp.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import SwiftUI

@main
struct PracVisonOSApp: App {
    @State private var mixedImmersionStyle: ImmersionStyle = .mixed
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.automatic)

        ImmersiveSpace(id: ImmersiveID.id) {
            ImmersiveView(viewModel: .init())
        }
        .immersionStyle(selection: $mixedImmersionStyle, in: .mixed)
    }
}
