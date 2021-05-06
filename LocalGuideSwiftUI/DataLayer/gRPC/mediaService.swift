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
    private let client = setupTLSClient()!
    
    private static func createGRPCClient() -> MediaProto_imageClient {
        let port = 443
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        
        let channel = ClientConnection.insecure(group: group)
          .connect(host: "media.zhancheng.dev", port: port)
        let client = MediaProto_imageClient(channel: channel)
        return client
    }
    
    private static func setupTLSClient() -> MediaProto_imageClient? {
        let hostName="media.zhancheng.dev"
        let port = 443
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        let builder: ClientConnection.Builder
        builder = ClientConnection.secure(group: group)
        let connection = builder.connect(host: hostName, port: port)
        print("Connection Status=>:\(connection.connectivity.state)")
        let client = MediaProto_imageClient(channel:connection)
        return client
    }
    
    func uploadImage(imageData: Data) -> String {
        var uploadRequest = MediaProto_ImageUploadRequest()
        uploadRequest.imageName = "test.jpg"
        uploadRequest.imageType = "image/jpeg"
        uploadRequest.imageSize = Int64(imageData.count)
        uploadRequest.chunk = imageData
        let call = client.imageUpload(uploadRequest)
        do {
            let response = try call.response.wait()
            print(response.imageID)
            return response.imageID
        } catch {
            print(error)
        }
        return ""
    }
}
