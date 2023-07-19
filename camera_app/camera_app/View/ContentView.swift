//
//  ContentView.swift
//  camera_app
//
//  Created by Arthur on 17.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            FrameView(image: nil)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
