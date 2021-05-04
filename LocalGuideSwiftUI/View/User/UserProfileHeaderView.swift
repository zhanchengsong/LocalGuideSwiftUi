//
//  UserProfileHeaderView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-03.
//

import SwiftUI

struct UserProfileHeaderView: View {
    var body: some View {
        VStack {
            Image(systemName: "person").resizable().scaledToFill().clipShape(Circle()).frame(width: 120, height: 120)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            
            Text("Display Name")
                .font(.system(size: 16, weight: .semibold))
            
            Text("@username")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("A very cool user")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12").font(.system(size: 16, weight: .bold))
                    Text("Followers").font(.footnote).foregroundColor(.gray)
                }
                VStack {
                    Text("12").font(.system(size: 16, weight: .bold))
                    Text("Followers").font(.footnote).foregroundColor(.gray)
                }
            }.padding()
            
            UserProfileActionButtonView(isCurrentUser: false)
            Spacer()
        }
    }
}

struct UserProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeaderView()
    }
}
