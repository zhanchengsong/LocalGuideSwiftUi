//
//  UserManager.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-02.
//

import Foundation
import CoreData

class UserManager {
    public static var shared = UserManager()
    private var persistenceController = PersistenceController.shared
    private var userService = UserService.shared
    private var userKeyChain = UserKeyChainManager.shared
    public func loginUserAndSaveToken(userReq: UserSignInRequest,
                                      onComplete: @escaping (Result<UserModel, Error>) -> Void,
                                      onError: @escaping (Result<UserError, Error>) -> Void) {
        userService.loginUser(loginUser: userReq) {
            result in
            switch result {
                case .success(let user): do {
                    if ( self.userKeyChain.getJWTToken(userId: user.userId) != nil ) {
                        print("Updating JWTToken")
                        self.userKeyChain.updateJWTToken(token: user.jwtToken, userId: user.userId)
                    }
                    else {
                        self.userKeyChain.saveJWTToken(token: user.jwtToken, userId: user.userId)
                        print("Setting JWTToken")
                    }
                    if ( self.userKeyChain.getRefreshToken(userId: user.userId) != nil ) {
                        print("Updating refreshToken")
                        self.userKeyChain.updateRefreshToken(token: user.refreshToken, userId: user.userId)
                    }
                    else {
                        print("Setting refreshToken")
                        self.userKeyChain.saveRefreshToken(token: user.refreshToken, userId: user.userId)
                    }
                    let userSessionToSave = UserSession(username: user.username, userId: user.userId, displayName: user.displayName, email: user.email, jwtToken: "", refreshToken: ""
                    )
                    self.saveUserSession(user: userSessionToSave)
                    onComplete(result)
                    
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
                                            self.userKeyChain.saveJWTToken(token: user.jwtToken, userId: user.userId)
                                            self.userKeyChain.saveRefreshToken(token: user.refreshToken, userId: user.userId)
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
    
    public func saveUserSession(user: UserSession) {
        print("Saving user session")
        let managedContext = self.persistenceController.container.viewContext
        let currentUser = NSEntityDescription.insertNewObject(forEntityName: "CurrentUser", into: managedContext) as! CurrentUser
        currentUser.displayName = user.displayName
        currentUser.email = user.email
        currentUser.userId = user.userId
        currentUser.username = user.username
        do {
            try managedContext.save()
        } catch let contextSaveError {
            print(contextSaveError)
        }
        
    }
    
    public func loadUserSession() -> UserSession? {
        print("Loading user")
        let managedContext = self.persistenceController.container.viewContext
        let fetchRequest = NSFetchRequest<CurrentUser>(entityName: "CurrentUser")
        
        do {
            let currentUser = try managedContext.fetch(fetchRequest)
            if (currentUser.isEmpty) {
                return nil
            }
            let fetched = currentUser[0]
            print("user loaded from core data")
            let userSession = UserSession(username: fetched.username!, userId: fetched.userId!, displayName: fetched.displayName!, email: fetched.email!, jwtToken: "", refreshToken: "", profileImage: nil)
            return userSession
            
        } catch let fetchError {
            print(fetchError)
        }
        return nil
    }
}
