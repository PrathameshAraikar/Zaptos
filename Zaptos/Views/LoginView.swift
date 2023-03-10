//
//  LoginView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var appvm: AppViewModel = AppViewModel()
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    @AppStorage("userCompletedOnBoarding") var userCompletedOnBoarding: Bool = true
    @AppStorage("userOnLoginScreen") var userOnLoginScreen: Bool = true
    @Binding var onBoardingState: Int
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var showEmailAlert: Bool = false
    @State var showPasswordAlert: Bool = false
    @State var emailAlertTitle: String = ""
    @State var passwordAlertTitle: String = ""
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30.0) {
                Text("Login")
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
                                .disableAutocorrection(true)
                                .textInputAutocapitalization(.never)
                                
                            
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
                                        .disableAutocorrection(true)
                                        .textInputAutocapitalization(.never)
                                    
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
                                        .disableAutocorrection(true)
                                        .textInputAutocapitalization(.never)
                                }
                                
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor( showPassword ? .white : .green)
                                        .frame(width: 30, height: 30)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                emailAlertTitle = handleEmailAlert()
                                passwordAlertTitle = handlePasswordAlert()
                                if emailAlertTitle == "" && passwordAlertTitle == "" {
                                    handleLoginButtonPressed()
                                }
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
                            .alert(emailAlertTitle, isPresented: $showEmailAlert) {}
                            .alert(passwordAlertTitle, isPresented: $showPasswordAlert) {}
                            .alert(appvm.userDoesNotExistTitle,
                                   isPresented: $appvm.showUserDoesNotExistAlert) {}
                            
                            Divider()
                            
                            VStack(alignment: .center) {
                                Text("OR")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                            
                            Button {
                                handleSignUpButtonPressed(onBoardingState: onBoardingState)
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
                            
                        }
                    )
                    .padding(.bottom, 40)
            }
            .padding()
        }
    }
}

extension LoginView {
    
    func handleEmailAlert() -> String {
        
        if email.isEmpty {
            showEmailAlert.toggle()
            return "Please enter your email id ????"
        }
        
        if email.count < 10 {
            showEmailAlert.toggle()
            return "Please enter complete email id ????????????"
        }
        
        if  !email.contains("@") {
            showEmailAlert.toggle()
            return "Invalid email ????????????"
        }
        
        return ""
    }
    
    func handlePasswordAlert() -> String {
        if password.isEmpty {
            showPasswordAlert.toggle()
            return "Please enter a password ????"
        }
        
        if password.count < 6 {
            showPasswordAlert.toggle()
            return "Password should be atleast 6 characters long ????????????"
        }
        
        return ""
    }
    
    func handleLoginButtonPressed() {
        
        appvm.login(email: email, password: password)
//        withAnimation(.spring()) {
//            currentUserSignIn = true
//        }
//        if appvm.isSignedIn {
//            withAnimation(.spring()) {
//                currentUserSignIn = true
//            }
//        }
//        } else {
//            userDoesNotExistTitle = "User doesn't exist Please Sign Up ????????????"
//            showUserDoesNotExistAlert.toggle()
//
//        }
    }
        
    func handleSignUpButtonPressed(onBoardingState: Int) {
        withAnimation(.spring()) {
            self.onBoardingState += 1
            userCompletedOnBoarding = true
            userOnLoginScreen = false
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(onBoardingState: .constant(3))
    }
}
