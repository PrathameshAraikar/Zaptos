//
//  SideMenuView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 07/06/22.
//

import SwiftUI

struct SideMenuView: View {
    
    @StateObject var appvm: AppViewModel = AppViewModel()
    @Binding var isShowingMenu: Bool
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = true
        
        var body: some View {
            ZStack {
                LinearGradient(colors: [Color(#colorLiteral(red: 0.1197352782, green: 0.1297318339, blue: 0.133856982, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    // Header
                    SideMenuHeader(isShowingMenu: $isShowingMenu)
                        .foregroundColor(.accentColor)
                        .frame(height: 180)
                    
                   // Options
                    ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                        NavigationLink {
                            Text(option.title)
                        } label: {
                            SideMenuOptions(viewModel: option)
                                .foregroundColor(Color("DP Color"))
                                .padding(.bottom)
                        }

                    }
                    
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing)
                        
                        Text("Sign Out")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundColor(.accentColor)
                    .padding(.leading, 20)
                    .padding(.top)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            appvm.signOut()
                            currentUserSignIn = false
                        }
                    }
                    
                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }
    }


struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowingMenu: .constant(true))
    }
}
