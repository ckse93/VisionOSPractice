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
    @State private var viewModel: ImmersiveViewModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await viewModel.start()
                }
        }
        .windowStyle(.automatic)
        
        WindowGroup(id: ImmersiveID.detailViewId, for: String.self) { value in
            DetailView(title: value.wrappedValue!)
                .environment(viewModel)
        }

        ImmersiveSpace(id: ImmersiveID.id) {
            ImmersiveView()
                .environment(viewModel)
        }
        .immersionStyle(selection: $mixedImmersionStyle, in: .mixed)
    }
}
