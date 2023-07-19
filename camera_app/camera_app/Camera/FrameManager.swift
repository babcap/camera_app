//
//  FrameManager.swift
//  camera_app
//
//  Created by Arthur on 19.07.2023.
//

import AVFoundation

class FrameManager: NSObject, ObservableObject {

    static let shared = FrameManager()
    
    @Published var current: CVPixelBuffer?

    let videoOutputQueue = DispatchQueue(
        label: "com.camera.VideoOutputQ",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem)
    // 5
    private override init() {
        super.init()
        CameraManager.shared.set(self, queue: videoOutputQueue)
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        if let buffer = sampleBuffer.imageBuffer {
            DispatchQueue.main.async {
                self.current = buffer
            }
        }
    }
}
