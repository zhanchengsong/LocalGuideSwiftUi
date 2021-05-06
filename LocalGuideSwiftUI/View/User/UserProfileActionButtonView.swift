//
//  UserProfileActionButtonView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-03.
//

import SwiftUI

struct UserProfileActionButtonView: View {
    let isCurrentUser: Bool
    var body: some View {
        if isCurrentUser {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile").frame(width: 360, height: 40).background(Color.blue).foregroundColor(.white).cornerRadius(20)
            })
        } else {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow").frame(width: 180, height: 40).background(Color.blue).foregroundColor(.white).cornerRadius(20)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message").frame(width: 180, height: 40).background(Color.purple).foregroundColor(.white).cornerRadius(20)
                })
            }
        }
        
    }
}

struct UserProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileActionButtonView(isCurrentUser: true)
    }
}
