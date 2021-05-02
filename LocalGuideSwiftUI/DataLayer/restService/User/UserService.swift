//
//  UserService.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-02.
//

import Foundation

class UserService {
    // Change this to use configuration !
    public static var shared = UserService()
    private var session: URLSession;
    
    private init() {
        print("Initing user service. This should be only called once")
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func registerUser(registerUser: UserRegistrationRequest,
                      successCompletion: @escaping (Result<UserModel, Error>) -> Void,
                      errorCompletion: @escaping (Result<UserError, Error>) -> Void) {

        do {
            let jsonBody = try JSONEncoder().encode(registerUser)
            let url = UserAPI.registerUserUrl
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonBody
            let task = session.dataTask(with: request) {
                (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    if (statusCode != 201) {
                        let result = self.processError(data: data, error: error)
                        errorCompletion(result)
                        return
                    }
                }
                let result = self.processUserResponse(data: data, error: error)
                successCompletion(result)
            }
            task.resume()
        } catch {
            print(error)
        }
    }
    
    func processUserResponse(data: Data?, error: Error?) -> Result<UserModel, Error>{
        guard let jsonData = data else {
            return .failure(error!)
        }
        return UserAPI.parseUser(fromJson: jsonData)
    }
    
    func processError(data: Data?, error: Error?) -> Result<UserError, Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return UserAPI.parseError(fromJson: jsonData)
    }
    
}
