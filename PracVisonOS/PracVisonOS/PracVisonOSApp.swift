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
        
        WindowGroup(id: ImmersiveID.detailViewId, for: String.self) { value in
            DetailView(title: value.wrappedValue!)
        }

        ImmersiveSpace(id: ImmersiveID.id) {
            ImmersiveView(viewModel: .init())
        }
        .immersionStyle(selection: $mixedImmersionStyle, in: .mixed)
    }
}
