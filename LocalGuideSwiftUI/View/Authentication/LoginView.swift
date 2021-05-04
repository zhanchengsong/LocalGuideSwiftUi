//
//  LoginView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-04-24.
//

import SwiftUI

struct LoginView: View {
    @State var email  = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("LGIcon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 50)
                        .padding(.top, 88)
                        .padding(.bottom, 100)
                    VStack(spacing: 16) {
                        GeneralTextField(text:$email, placeholder: Text("Email"), imageName: "envelope", hasError: false)
                            .padding()
                            .background(Color(.init(gray:1, alpha:0.30)))
                            .cornerRadius(10)
                        
                        GeneralSecureField(text:$password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(gray:1, alpha:0.30)))
                            .cornerRadius(10)
                    }.padding(.horizontal, 40)
                    
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Text("Forgot password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.gray)
                                .padding(.top, 16)
                                .padding(.trailing, 40)
                        })
                    }
                    
                    Button(action: {}, label: {
                        Text("Login in")
                            .font(.headline)
                            .foregroundColor(Color("primaryPinkText"))
                            .frame(width: 320, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                        
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: SignUpView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account ? ")
                                    .font(.system(size:14))
                                Text("Sign up")
                                    .font(.system(size:14, weight: .bold))
                            }.foregroundColor(Color("primaryPinkText"))
                            .padding(.bottom, 40)
                        })
                }
            }
            .background((Color("primaryPink")))
            .ignoresSafeArea()
        }
    }
    
    func onEmailEnter(input: String) -> Bool {
        return false
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
