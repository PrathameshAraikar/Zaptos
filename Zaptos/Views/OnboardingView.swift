//
//  OnboardingView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var onboardingState: Int = 0
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                switch onboardingState {
                case 0:
                    Item1(imageName: "ZaptosLogo", title: "WELCOME TO ZAPTOS", description: "")
                        .transition(transition)
                    
                case 1:
                    Item2(imageName: "ShoeImage", title: "Elegance you wear", description: "If you haven’t got a good pair of shoes, then you haven’t got any.")
                        .transition(transition)
                    
                case 2:
                    Item3(imageName: "DP Logo", title: "Made By")
                        .transition(transition)
                    
                case 3:
                    LoginView(onBoardingState: $onboardingState)
                        .transition(transition)
                    
                case 4:
                    SignUpView(onBoardingState: $onboardingState)
                        .transition(transition)
                    
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            }
            
            VStack {
                Spacer()
                if onboardingState == 3 || onboardingState == 4 {
                    bottomButton.hidden()
                } else {
                    bottomButton
                }
                
            }
            .padding()
        }
        
    }
}

extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Next" :
                onboardingState == 2 ? "Get Started" :
                onboardingState == 3 ? "Sign Up" : "Next")
        .foregroundColor(Color("BackgroundColor"))
        .font(.system(size: 25))
        .fontWeight(.semibold)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(onboardingState == 3 ? Color.white : Color("DP Color"))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(.vertical)
        .onTapGesture {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
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
                Spacer()
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
                
                Spacer()
                Spacer()
                
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
                Spacer()
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
                
                Spacer()
                Spacer()
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
                Spacer()
                
            }
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        //        Item1(imageName: "ZaptosLogo", title: "WELCOME TO ZAPTOS", description: "")
        //        Item2(imageName: "ShoeImage", title: "Hello World", description: "If you haven’t got a good pair of shoes, then you haven’t got any.")
        //        Item3(imageName: "DP Logo", title: "Made By")
    }
}

