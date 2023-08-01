//
//  PracVisonOSApp.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import SwiftUI

@main
struct PracVisonOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
