//
//  SideMenuView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 07/06/22.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var isShowingMenu: Bool
        
        var body: some View {
            ZStack {
                LinearGradient(colors: [Color(#colorLiteral(red: 0.1197352782, green: 0.1297318339, blue: 0.133856982, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack {
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
