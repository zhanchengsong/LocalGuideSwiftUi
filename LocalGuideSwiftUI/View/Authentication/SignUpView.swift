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
    
    @State var emailError = ""
    @State var passwordError = ""
    @State var displayNameError = ""
    @State var usernameError = ""
    
    @State var showImagePicker = false
    @State var image: Image?
    @State var selectedImage: UIImage?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var authViewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .foregroundColor(Color("primaryPinkText"))
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.top, 100)
                            .padding(.bottom, 50)
                            .onTapGesture {
                                showImagePicker.toggle()
                            }
                            .sheet(isPresented: $showImagePicker,onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })
                        
                    }
                    else {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .foregroundColor(Color("primaryPinkText"))
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.top, 100)
                            .padding(.bottom, 50)
                            .onTapGesture {
                                showImagePicker.toggle()
                            }
                            .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })
                }
                VStack(spacing: 16) {
                    GeneralTextField(text:$displayName, placeholder: Text("Display Name"), imageName: "person", hasError: false)
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                    
                    GeneralTextField(text:$username, placeholder: Text("Username"), imageName: "keyboard", hasError: false)
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                        .onChange(of: username, perform: { value in
                            print("username state change: " + value)
                        })
                    
                    GeneralTextField(text:$email, placeholder: Text("Email"), imageName: "envelope", hasError: false)
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                        .cornerRadius(10)
                    
                    GeneralSecureField(text:$password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(gray:1, alpha:0.30)))
                        .cornerRadius(10)
                }.padding(.horizontal, 40)
                
                
                Button(action: {
                    guard let selectedImage = selectedImage else { return }
                    authViewModel.signup(email: email, displayName: displayName, username: username, password: password, profileImage: selectedImage)
                }, label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(Color("primaryPinkText"))
                        .frame(width: 320, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                    
                })
                
                Spacer()
                
                Button(
                    action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            Text("Have an account ? ")
                                .font(.system(size:14))
                            Text("Log in")
                                .font(.system(size:14, weight: .bold))
                        }.foregroundColor(Color("primaryPinkText"))
                        .padding(.bottom, 40)
                    }
                )
                
            }
            
        }
        .background((Color("primaryPink")))
        .ignoresSafeArea()
    }
    
    func onDisplayNameEnter(input: String) -> Bool{
        return true
    }
    
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
    
}
