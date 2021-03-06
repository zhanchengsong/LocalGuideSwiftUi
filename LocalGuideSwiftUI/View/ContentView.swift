//
//  ContentView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng on 2021-04-18.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        Group {
            if authViewModel.userSession != nil {
                NavigationView {
                    TabView {
                        FeedView()
                            .tabItem {
                                Image (systemName: "house")
                                Text("Home")
                            }
                        UserProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Text("")
                            }
                        SignUpView()
                            .tabItem {
                                Image (systemName: "pencil")
                                Text("SignUp")
                            }
                    }
                }.navigationBarTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                LoginView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
