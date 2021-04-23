//
//  SearchView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-04-20.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
        }
        
        
    }
}
// A generic search bar component
struct SearchBar: View {
    @Binding var text:String
    var body: some View {
        HStack {
            TextField("Search...", text:$text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }.padding(.horizontal, 10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
