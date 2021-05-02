//
//  SignUpView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-04-24.
//

import SwiftUI

struct SignUpView: View {
    @State var email  = ""
    @State var password = ""
    @State var displayName = ""
    @State var username = ""
    
    var body: some View {
        ZStack {
            VStack {
                Image("LGIcon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 50)
                    .padding(.top, 88)
                    .padding(.bottom, 100)
                VStack(spacing: 16) {
                    GeneralTextField(text:$displayName, placeholder: Text("Display Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                    
                    GeneralTextField(text:$displayName, placeholder: Text("Username"), imageName: "keyboard")
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                    
                    GeneralTextField(text:$email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                        .cornerRadius(10)
                    
                    GeneralSecureField(text:$password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                        .cornerRadius(10)
                }.padding(.horizontal, 40)
                
                
                Button(action: {}, label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(Color("primaryPinkText"))
                        .frame(width: 320, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                    
                })
                
                Spacer()
                
                HStack {
                    Text("Have an account ? ")
                        .font(.system(size:14))
                    Text("Log in")
                        .font(.system(size:14, weight: .bold))
                }.foregroundColor(Color("primaryPinkText"))
                .padding(.bottom, 40)
            }
        }
        .background((Color("primaryPink")))
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
