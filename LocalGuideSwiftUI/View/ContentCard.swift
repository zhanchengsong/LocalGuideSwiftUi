//
//  ContentCard.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-04-19.
//

import SwiftUI

struct ContentCard: View {
    var body: some View {
        VStack(alignment:.leading) {
            ContentCardUserHeader()
            // Main content image
            Image("torontoImage").resizable().scaledToFit()
            // Action bar
            VStack(alignment:.leading) {
                ContentCardActions()
                ContentLike()
                ContentCommentSummary()
                ContentAddComment()
            }.padding(.leading, 10)
            
            Divider()
        }
    }
}

struct ContentCardUserHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "person").resizable().frame(width:32, height: 32).clipShape(Circle()).padding(.leading)
            Text("Display Name").font(.system(size:16, weight:.semibold))
            Spacer()
            Image(systemName: "ellipsis").padding()
            
        }
    }
}
struct ContentCardActions: View {
    var body: some View {
        HStack() {
            Image(systemName: "heart").frame(width:40, height:40)
            Image(systemName: "message").frame(width:40, height:40)
            Image(systemName: "paperplane").frame(width:40, height:40)
            Spacer()
            Image(systemName: "bookmark").frame(width:40, height:40)
        }
    }
}

struct ContentLike: View {
    var body: some View {
        HStack{
            Text("Liked by").font(.system(size: 16))
            Text("zsong").font(.system(size: 16)).bold()
            Text("and").font(.system(size: 16))
            Text("others").font(.system(size: 16)).bold()
        }
    }
}

struct ContentCommentSummary: View {
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Text("some_frined").font(.system(size: 16)).bold()
                Text("test comment truncated ...").font(.system(size: 16))
                Text("more").font(.system(size: 16)).foregroundColor(.gray)
            }
            HStack {
                Text("View all 2 comments").font(.system(size: 16)).foregroundColor(.gray)
            }.padding(.top,2)
        }.padding(.top, 2)
        
    }
}

struct ContentAddComment: View {
    var body: some View {
        HStack(alignment:.center) {
            Image(systemName: "person").resizable().frame(width:24, height: 24).clipShape(Circle())
            Text("Add a comment...").font(.system(size: 16)).foregroundColor(.gray)
        }
    }
}

struct ContentCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentCard()
    }
}
