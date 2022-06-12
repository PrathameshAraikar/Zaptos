//
//  AppViewModel.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 13/06/22.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {return}
        } 
        
        // Successfully Signed In
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {return}
        }
        
        // Successfully Signed Up
    }
    
    func signOut() {
       try? auth.signOut()
        
        // Successfully Signed Out
    }
}
