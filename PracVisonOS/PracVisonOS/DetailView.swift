//
//  DetailView.swift
//  PracVisonOS
//
//  Created by Chan Jung on 8/7/23.
//

import SwiftUI

struct DetailView: View {
    @State var title: String
    
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack {
            Text("Entity Name is \(title)")
                .font(.title)
                .bold()
            
            Button {
                dismissWindow(id: ImmersiveID.detailViewId)
            } label: {
                Text("dismiss")
            }

        }
    }
}
