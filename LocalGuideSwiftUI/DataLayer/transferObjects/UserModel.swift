//
//  UserModel.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-02.
//

import Foundation

struct UserModel : Codable{
    let username: String;
    let userId: String;
    let displayName: String;
    let email: String;
    let password: String?;
    let jwtToken: String;
    let refreshToken: String;
}

struct UserRegistrationRequest : Codable {
    let username: String;
    let displayName: String;
    let email: String;
    let password: String;
}
