//
//  AuthViewModel.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-04.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var userSession: UserSession?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var isSuccessful = false
    
    private var userKeyChain = UserKeyChainManager.shared
    private var mediaService = MediaService.shared
    private var userManager = UserManager.shared
    
    init() {
        // Try to grab user from localStorage
        // And then fetch JWT/RefreshToken
        self.userSession = {
            let userSession = userManager.loadUserSession()
            guard var userSessionUnwrapped = userSession else {return nil}
            
            let jwtToken = self.userKeyChain.getJWTToken(userId: userSessionUnwrapped.userId)
            guard let jwtTokenUnwrapped = jwtToken else {
                print("Unable to read jwtToken")
                return nil
            }
            let refreshToken = self.userKeyChain.getRefreshToken(userId: userSessionUnwrapped.userId)
            guard let refreshTokenUnwrapped = refreshToken else {
                print("Unable to read refreshToken")
                return nil
            }
            userSessionUnwrapped.jwtToken = jwtTokenUnwrapped
            userSessionUnwrapped.refreshToken = refreshTokenUnwrapped
            return userSessionUnwrapped
        }()
        
    }
    
   
    
    func login(username: String, password: String) {
        let loginUser = UserSignInRequest(username: username, password: password)
        userManager.loginUserAndSaveToken(userReq: loginUser, onComplete: { result in
            switch (result) {
                case .success(let user): do {
                    let userSession = UserSession(username: user.username, userId:user.userId, displayName:user.displayName, email: user.email, jwtToken: user.jwtToken, refreshToken: user.refreshToken, profileImage: Image(systemName: "airplane"))
                    DispatchQueue.main.async {
                        self.error = nil
                        self.isAuthenticating = false
                        self.isSuccessful = true
                        self.userSession = userSession
                    }
                }
                case .failure(let error): do {
                    print(error)
                }
            }
            
        }, onError: { result in
            switch (result) {
                case .success(let userError):
                    DispatchQueue.main.async {
                        self.isSuccessful = false
                    }
                    print(userError)
                case .failure(let error):
                    print(error)
                    DispatchQueue.main.async {
                        self.isSuccessful = false
                        self.error = error }
            }
        })
        
        
    }
    
    func signup(email: String, displayName: String, username: String, password: String, profileImage: UIImage) {
        // Register the user first
        
        let imageId = mediaService.uploadImage(imageData: profileImage.jpegData(compressionQuality: 0.3)!)
        let signUpUser = UserRegistrationRequest(username: username,
                                                 displayName: displayName,
                                                 email: email,
                                                 password: password,
                                                 imageId: imageId)
        userManager.registerUserAndSaveToken(userReq: signUpUser,
                                             onComplete: { result in
                                                switch(result) {
                                                    case .success(let user):
                                                        let userSession = UserSession(username: user.username, userId:user.userId, displayName:user.displayName, email: user.email, jwtToken: user.jwtToken, refreshToken: user.refreshToken, profileImage: (user.imageId != nil) ? Image(systemName: "airplane") : Image(uiImage: profileImage) )
                                                        DispatchQueue.main.async {
                                                            self.isSuccessful = true
                                                            self.isAuthenticating = false
                                                            self.error = nil
                                                            self.userSession = userSession
                                                        }
                                                        
                                                    case .failure(let error):
                                                        print(error)
                                                }
                                                
                                                
                                             }, onError: { result in
                                                switch(result) {
                                                    case .success(let apiError):
                                                        print(apiError)
                                                    case .failure(let error):
                                                        print(error)
                                                }
                                             })
    }
}
