//
//  UserManager.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-02.
//

import Foundation

class UserManager {
    public static var shared = UserManager()
    
    private var userService = UserService.shared
    
    
    // Register a user and save the Tokens in the keychain if successful.
    // Return true if success, false on error
    public func registerUserAndSaveToken(userReq: UserRegistrationRequest) {
        userService.registerUser(registerUser: userReq,
        successCompletion:{
            result in
                switch result {
                    case .success(let user): do {
                        print(user)
                        UserKeyChainManager.saveJWTToken(token: user.jwtToken, userId: user.userId)
                    }
                    case .failure(let error): do {
                        print(error)
                    }
            
            }
        },
        errorCompletion:{
            errorResult in
            switch errorResult {
                case .success(let userError): do {
                    print(userError)
                }
                case .failure(let error): do {
                    print(error)
                }
        
            }
        })
    }
}
