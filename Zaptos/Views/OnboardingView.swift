//
//  OnboardingView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            Item1(imageName: "ZaptosLogo", title: "WELCOME TO ZAPTOS", description: "")
            
            Item2(imageName: "ShoeImage", title: "Hello World", description: "If you haven’t got a good pair of shoes, then you haven’t got any.")
            
            Item3(imageName: "DP Logo", title: "Made By")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct Item1: View {
    
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20.0) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 250)
                    .clipShape(Circle())
                    .cornerRadius(20)
                    .shadow(color: .white.opacity(0.5), radius: 10, x: 0, y: 0)
                    .padding()
                
                Text(title)
                    .font(.system(.title, design: .serif))
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 10, x: 0, y: 0)
                
            }
        }
    }
}

struct Item2: View {
    
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20.0) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .shadow(color: .white.opacity(0.5), radius: 10, x: 0, y: 0)
                    .padding(.bottom, 40)
                
                Text(title)
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 10)
                
                Text(description)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 10)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct Item3: View {
    
    @State var showLoginView: Bool = false
    let imageName: String
    let title: String
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 10)
                    .padding(.bottom, 40)
                
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 350)
                
                Spacer()
                
                Button {
                    withAnimation {
                        showLoginView = true
                    }
                } label: {
                    Text("Get Started")
                        .foregroundColor(Color("BackgroundColor"))
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color("DP Color"))
                        .cornerRadius(10)
                        .shadow(color: Color("DP Color").opacity(0.5), radius: 10, x: 5, y: 10)
                        .padding()
                }
                .padding()
                
                Spacer()
            }
        }
        .overlay {
            Group {
                if showLoginView {
                    LoginView()
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        //        OnboardingView()
        Item1(imageName: "ZaptosLogo", title: "WELCOME TO ZAPTOS", description: "")
        Item2(imageName: "ShoeImage", title: "Hello World", description: "If you haven’t got a good pair of shoes, then you haven’t got any.")
        Item3(imageName: "DP Logo", title: "Made By")
    }
}

