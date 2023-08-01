//
//  ContentView.swift
//  PracVisonOS
//
//  Created by Chan Jung on 7/31/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {

    @State private var showImmersiveSpace = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Button(action: {
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
