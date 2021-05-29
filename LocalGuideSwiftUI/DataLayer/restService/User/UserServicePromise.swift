//
//  UserServicePromise.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-28.
//

import Foundation
import Promises
import Alamofire

class UserServicePromise {
    public static var shared = UserServicePromise()
    
    func registerUser(registerUser: UserRegistrationRequest) -> Promise<UserModel> {
        let url = UserAPI.registerUserUrl
        let promise = Promise<UserModel> {fufill, reject in
            do {
                // Form the request
                let jsonBody = try JSONEncoder().encode(registerUser)
                var request = URLRequest(url: url)
                request.httpMethod = HTTPMethod.post.rawValue
                request.httpBody = jsonBody
                // send request using AF
                AF.request(request).validate(statusCode: 200 ..< 201).responseDecodable(of: UserModel.self) {
                    response in
                    guard let registeredUser = response.value else { return }
                    fufill(registeredUser)
                }
                
            }
            catch {
                reject(error)
            }
        }
        return promise
    }
}
