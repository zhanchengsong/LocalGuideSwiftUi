//
//  mediaService.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-04-26.
//

import Foundation
import GRPC
import NIO

class MediaService {
    // Singleton instance
    static let shared = MediaService()
    
    private init() {}
    private let client = createGRPCClient()
    
    private static func createGRPCClient() -> MediaProto_imageClient {
        let port = 5005
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        
        let channel = ClientConnection.insecure(group: group)
          .connect(host: "localhost", port: port)
        let client = MediaProto_imageClient(channel: channel)
        return client
    }
    
    func upLoadImage(imageData: Data) {
        var uploadRequest = MediaProto_ImageUploadRequest()
        uploadRequest.imageName = "test.jpg"
        uploadRequest.imageType = "image/jpeg"
        uploadRequest.imageSize = Int64(imageData.count)
        uploadRequest.chunk = imageData
        let call = client.imageUpload(uploadRequest)
        do {
            let response = try call.response.wait()
            print(response.imageID)
        } catch {
            print(error)
        }
    
    }
}
