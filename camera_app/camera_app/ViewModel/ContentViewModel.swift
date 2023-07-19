//
//  ContentViewModel.swift
//  camera_app
//
//  Created by Arthur on 19.07.2023.
//

import CoreImage

class ContentViewModel: ObservableObject {

    @Published var frame: CGImage?

    private let frameManager = FrameManager.shared
    
    init() {
        setupSubscriptions()
    }

    func setupSubscriptions() {
        frameManager.$current
            .receive(on: RunLoop.main)
            .compactMap { buffer in
                return CGImage.create(from: buffer)
            }
            .assign(to: &$frame)
        
    }
}
