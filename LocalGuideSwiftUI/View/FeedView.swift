//
//  FeedView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng on 2021-04-18.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack (alignment: .bottomTrailing ) {
            
            ScrollView {
                
            }
            
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width:32, height: 32)
                    .padding()
            }).background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
