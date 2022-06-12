//
//  LoginView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct LoginView: View {
    
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30.0) {
                Image("ZaptosLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 10, x: 0, y: 0)
                
                
                Text("Welcome to ZAPTOS")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .frame(width: 350, height: 200)
                    .shadow(radius: 10)
                    .overlay(
                        VStack {
                            TextField("Email id...", text: $email)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .background(Color.gray.opacity(0.3))
                                .font(.headline)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding()
                            
                            
                            SecureField("Your Password", text: $password)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .background(Color.gray.opacity(0.3))
                                .font(.headline)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding()
                            
                        }
                    )
            }
            .padding()
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
