//
//  UserSession.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-05.
//

import Foundation
import SwiftUI

// This is a generic representation of a user across the app
struct UserSession {
    let username: String;
    let userId: String;
    let displayName: String;
    let email: String;
    var jwtToken: String;
    var refreshToken: String;
    var profileImage: Image?;
}
