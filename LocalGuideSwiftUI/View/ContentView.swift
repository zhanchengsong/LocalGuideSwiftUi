//
//  ContentView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng on 2021-04-18.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image (systemName: "house")
                        Text("Home")
                    }
                Text("Search")
                    .tabItem {
                        Image (systemName: "magnifyingglass")
                        Text("Search")
                    }
                Text("Messages")
                    .tabItem {
                        Image (systemName: "envelope")
                        Text("Messages")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
