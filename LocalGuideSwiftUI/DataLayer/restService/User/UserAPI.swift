//
//  UserAPI.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-02.
//

import Foundation

enum UserEndpoint: String {
    case user="user"
    case login="login"
    case token="token"
}

class UserAPI {
    private static let baseURLString = "https://auth.zhancheng.dev"
    private static func userURL(endpoint: UserEndpoint, parameters: [String:String]? = nil) -> URL {
        var components = URLComponents(string: baseURLString + "/" + endpoint.rawValue)!
        var queryItems = [URLQueryItem]()
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    
    static var registerUserUrl: URL {
        return userURL(endpoint: UserEndpoint.user)
    }
    
    static func parseUser(fromJson data: Data) -> Result<UserModel, Error> {
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(UserModel.self, from: data)
            return Result.success(user)
        } catch {
            return Result.failure(error)
        }
    }
}
