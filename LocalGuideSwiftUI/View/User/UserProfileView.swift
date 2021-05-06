//
//  UserProfile.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-03.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var selectedOption: TweetFilterOptions = TweetFilterOptions.posts
    var body: some View {
        ScrollView {
            
            VStack {
                UserProfileHeaderView(
                    displayName: authViewModel.userSession!.displayName , username: (authViewModel.userSession!.username)
                    
                ).padding()
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
