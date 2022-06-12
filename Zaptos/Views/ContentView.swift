//
//  ContentView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            if currentUserSignIn {
                MainView()
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
