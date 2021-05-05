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
    
    public func loginUserAndSaveToken(userReq: UserSignInRequest,
                                      onComplete: @escaping (Result<UserModel, Error>) -> Void,
                                      onError: @escaping (Result<UserError, Error>) -> Void) {
        userService.loginUser(loginUser: userReq) {
            result in
            switch result {
                case .success(let user): do {
                    print(user)
                    if ( UserKeyChainManager.getJWTToken(userId: user.userId) != "" ) {
                        UserKeyChainManager.saveJWTToken(token: user.jwtToken, userId: user.userId)
                        onComplete(result)
                    }
                }
                case .failure(let error): do {
                    print(error)
                }
            }
        } errorCompletion: { result in
            switch result {
                case .success(let userError): do {
                    print(userError)
                    onError(result)
                }
                case .failure(let error): do {
                    print(error)
                }
            }
        }

    }
    
    // Register a user and save the Tokens in the keychain if successful.
    // Return true if success, false on error
    public func registerUserAndSaveToken(userReq: UserRegistrationRequest,
                                         onComplete: @escaping (Result<UserModel, Error>) -> Void,
                                         onError: @escaping (Result<UserError, Error>) -> Void ) {
        
        userService.registerUser(registerUser: userReq,
                                 successCompletion:{
                                    result in
                                    switch result {
                                        case .success(let user): do {
                                            print(user)
                                            UserKeyChainManager.saveJWTToken(token: user.jwtToken, userId: user.userId)
                                            onComplete(result)
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
                                            onError(errorResult)
                                        }
                                        case .failure(let error): do {
                                            print(error)
                                        }
                                        
                                    }
                                 })
    }
}
