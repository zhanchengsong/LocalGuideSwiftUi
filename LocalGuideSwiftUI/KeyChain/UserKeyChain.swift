//
//  UserKeyChain.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-02.
//

import Foundation
import Locksmith

class UserKeyChainManager {
    public static let shared = UserKeyChainManager()
    
    public static func saveJWTToken(token: String, userId: String) {
        do {
            try Locksmith.saveData(data: ["jwtToken": token], forUserAccount: userId)
        } catch {
            print(error)
        }
    }
    
    public static func saveRefreshToken(token: String, userId: String) {
        do {
            try Locksmith.saveData(data: ["refreshToken": token], forUserAccount: userId)
        } catch {
            print(error)
        }
    }
    
    public static func getJWTToken(userId: String) -> String {
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: userId)
        return dictionary!["jwtToken"] as! String
    }
    
    public static func getRefreshToken(userId: String) -> String {
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: userId)
        return dictionary!["refreshToken"] as! String
    }
    
    public static func updateJWTToken(token: String, userId: String) {
        do {
            try Locksmith.updateData(data: ["jwtToken": token], forUserAccount: "myUserAccount")
        }
        catch {
            print(error)
        }
    }
}
