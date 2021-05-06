//
//  UserKeyChain.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-02.
//

import Foundation
import KeychainSwift

class UserKeyChainManager {
    private var keyChain = KeychainSwift()
    public static let shared = UserKeyChainManager()
    
    public func saveJWTToken(token: String, userId: String) {
        if ( self.keyChain.set(token, forKey: userId + "_jwtToken") ) {
            print("successfully saved JWTToken")
        }
    }
    
    public func saveRefreshToken(token: String, userId: String) {
        if ( self.keyChain.set(token, forKey: userId + "_refreshToken") ) {
            print("successfully saved refresToken")
        }
    }
    
    public func getJWTToken(userId: String) -> String? {
        guard let data = keyChain.getData(userId + "_jwtToken") else {return nil}
        print("read jwtToken success from keychain: " + String(decoding: data, as:UTF8.self))
        return String(decoding: data, as:UTF8.self)
    }
    
    public func getRefreshToken(userId: String) -> String? {
        guard let data = keyChain.getData(userId + "_refreshToken") else {return nil}
        print("read refresh success from keychain: " + String(decoding: data, as:UTF8.self))
        return String(decoding: data, as:UTF8.self)
    }
    
    public func updateJWTToken(token: String, userId: String) {
        if (keyChain.set(token, forKey: userId + "_jwtToken")) {
            print("succesfully updated jwtToken")
        }
    }
    
    public func updateRefreshToken(token: String, userId: String) {
        if ( self.keyChain.set(token, forKey: userId + "_refreshToken") ) {
            print("successfully updated refresToken")
        }
    }
}
