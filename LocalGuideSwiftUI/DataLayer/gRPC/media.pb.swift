// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: media.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct MediaProto_ImageUploadRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var imageName: String = String()

  var imageType: String = String()

  var imageSize: Int64 = 0

  var chunk: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct MediaProto_ImageUploadResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var imageID: String = String()

  var url: String = String()

  var size: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "mediaProto"

extension MediaProto_ImageUploadRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ImageUploadRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "imageName"),
    2: .same(proto: "imageType"),
    3: .same(proto: "imageSize"),
    4: .same(proto: "chunk"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.imageName) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.imageType) }()
      case 3: try { try decoder.decodeSingularInt64Field(value: &self.imageSize) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.chunk) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.imageName.isEmpty {
      try visitor.visitSingularStringField(value: self.imageName, fieldNumber: 1)
    }
    if !self.imageType.isEmpty {
      try visitor.visitSingularStringField(value: self.imageType, fieldNumber: 2)
    }
    if self.imageSize != 0 {
      try visitor.visitSingularInt64Field(value: self.imageSize, fieldNumber: 3)
    }
    if !self.chunk.isEmpty {
      try visitor.visitSingularBytesField(value: self.chunk, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: MediaProto_ImageUploadRequest, rhs: MediaProto_ImageUploadRequest) -> Bool {
    if lhs.imageName != rhs.imageName {return false}
    if lhs.imageType != rhs.imageType {return false}
    if lhs.imageSize != rhs.imageSize {return false}
    if lhs.chunk != rhs.chunk {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension MediaProto_ImageUploadResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ImageUploadResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "imageId"),
    2: .same(proto: "url"),
    3: .same(proto: "size"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.imageID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.url) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.size) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.imageID.isEmpty {
      try visitor.visitSingularStringField(value: self.imageID, fieldNumber: 1)
    }
    if !self.url.isEmpty {
      try visitor.visitSingularStringField(value: self.url, fieldNumber: 2)
    }
    if self.size != 0 {
      try visitor.visitSingularInt32Field(value: self.size, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: MediaProto_ImageUploadResponse, rhs: MediaProto_ImageUploadResponse) -> Bool {
    if lhs.imageID != rhs.imageID {return false}
    if lhs.url != rhs.url {return false}
    if lhs.size != rhs.size {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
