//
//  FilterButtonView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-05-03.
//

import SwiftUI

enum TweetFilterOptions: Int, CaseIterable {
    case posts
    case replies
    case likes
    
    var title: String {
        switch self {
        case .posts: return "Posts"
        case .replies: return "Posts & Replies"
        case .likes: return "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var underlinePadding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    var body: some View {
        VStack(alignment:.leading){
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) {
                    option in
                    Button(action:{
                        self.selectedOption = option
                    }, label: {
                        Text(option.title).frame(width: underlineWidth).foregroundColor(.blue)
                    })
                }
            }
            
            Rectangle()
                .frame(width: underlineWidth - 24, height:3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, underlinePadding)
                .animation(.spring())
                
        }
    }
}

