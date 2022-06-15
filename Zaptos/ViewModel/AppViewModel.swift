//
//  AppViewModel.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 13/06/22.
//
import SwiftUI
import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    @Published var showUserDoesNotExistAlert: Bool = false
    @Published var userDoesNotExistTitle: String = ""
    @Published var showUserAlreadyExistsAlert: Bool = false
    @Published var userAlreadyExistsTitle: String = ""
    
    let auth = Auth.auth()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.userDoesNotExistTitle = "User doesn't exist Please Sign Up 😥😥😥"
                self.showUserDoesNotExistAlert.toggle()
                print(error?.localizedDescription ?? "Error occured!!")
            } else {
                withAnimation(.spring()) {
                    self.currentUserSignIn = true
                }
            }
        }
        
        // Successfully Signed In
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                self.userAlreadyExistsTitle =  "The email address is already in use 🫣🫣🫣"
                self.showUserAlreadyExistsAlert.toggle()
                print(error?.localizedDescription ?? "Error occured!!")
            } else {
                withAnimation(.spring()) {
                    self.currentUserSignIn = true
                }
            }
            
            // Successfully Signed Up
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        // Successfully Signed Out
    }
}
