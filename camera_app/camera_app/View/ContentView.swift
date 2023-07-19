//
//  ContentView.swift
//  camera_app
//
//  Created by Arthur on 17.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()

    var body: some View {
        ZStack {
            ErrorView(error: model.error)
            FrameView(image: model.frame)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
