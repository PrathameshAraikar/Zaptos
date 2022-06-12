//
//  SignUpView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 12/06/22.
//

import SwiftUI

struct SignUpView: View {
    
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    @AppStorage("userOnLoginScreen") var userOnLoginScreen: Bool = false
    @Binding var onBoardingState: Int
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30.0) {
                Text("Sign Up")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom, 30)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.clear)
                    .frame(width: 350, height: 450)
                    .shadow(radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            HStack(spacing: 20.0) {
                                Image(systemName: "envelope")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .padding(.leading, 25)
                                
                                Text("Email")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.light)
                            }
                            .padding(.top)
                            
                            
                            TextField("", text: $email)
                                .placeholder(when: email.isEmpty, placeholder: {
                                    Text("mikasa@gmail")
                                        .foregroundColor(.gray)
                                })
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .padding()
                                
                            Divider()
                            
                            HStack(spacing: 20.0) {
                                Image(systemName: "lock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .padding(.leading, 25)
                                
                                Text("Password")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.light)
                            }
                            .padding(.top)
                            
                            
                            HStack {
                                if showPassword {
                                    TextField("", text: $password)
                                        .placeholder(when: password.isEmpty, placeholder: {
                                            Text("123456")
                                                .foregroundColor(.gray)
                                        })
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .foregroundColor(.white)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(20)
                                        .padding()
                                } else {
                                    SecureField("", text: $password)
                                        .placeholder(when: password.isEmpty, placeholder: {
                                            Text("123456")
                                                .foregroundColor(.gray)
                                        })
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .foregroundColor(.white)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(20)
                                        .padding()
                                }
                                
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor( showPassword ? .green : .white)
                                        .frame(width: 30, height: 30)
                                }
                            }
                            
                                                        
                            Spacer()
                            
                            Button {
                                handleSignUpButtonPressed()
                            } label: {
                                Text("Sign Up")
                                    .foregroundColor(Color("BackgroundColor"))
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(.vertical)
                            }
                            
                            Divider()
                            
                            VStack(alignment: .center) {
                                Text("OR")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                                
                            Button {
                                handleLoginButtonPressed(onBoardingState: onBoardingState)
                            } label: {
                                Text("Login")
                                    .foregroundColor(Color("BackgroundColor"))
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(.vertical)
                            }
                            
                        }
                    )
                    .padding(.bottom, 40)
            }
            .padding()
        }
    }
}

extension SignUpView {
    
    func handleSignUpButtonPressed() {
        withAnimation(.spring()) {
            currentUserSignIn = true
        }
    }
    
    func handleLoginButtonPressed(onBoardingState: Int) {
        
        withAnimation(.spring()) {
            self.onBoardingState -= 1
            userOnLoginScreen = true
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(onBoardingState: .constant(2))
    }
}
