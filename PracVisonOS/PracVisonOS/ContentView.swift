//
//  ContentView.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await openImmersiveSpace(id: ImmersiveID.id)
                }
                print("button tapped")
            }, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    ContentView()
}

struct ImmersiveID {
    static let id = "Immersive space open!"
    static let detailViewId = "details view id"
}
