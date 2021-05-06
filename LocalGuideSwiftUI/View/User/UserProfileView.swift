//
//  UserProfile.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-03.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedOption: TweetFilterOptions = TweetFilterOptions.posts
    var body: some View {
        ScrollView {
            
            VStack {
                UserProfileHeaderView().padding()
                FilterButtonView(selectedOption: $selectedOption)
            }
            .navigationTitle("Display Name")
            
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
