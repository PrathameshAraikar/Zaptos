//
//  ContentView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var loginViewState: Int = 3
    @State var signupViewState: Int = 4
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    @AppStorage("userCompletedOnBoarding") var userCompletedOnBoarding: Bool = false
    @AppStorage("userOnLoginScreen") var userOnLoginScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            if currentUserSignIn {
                MainView()
            } else if userCompletedOnBoarding {
                if userOnLoginScreen {
                    LoginView(onBoardingState: $loginViewState)
                        .transition(.move(edge: .trailing))
                } else {
                    SignUpView(onBoardingState: $signupViewState)
                        .transition(.move(edge: .trailing))
                }
                
            } else {
                OnboardingView()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

// VVIMP Code to change the placeholder text color
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ShoeViewModel())
    }
}
