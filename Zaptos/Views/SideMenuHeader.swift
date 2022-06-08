//
//  SideMenuHeader.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 07/06/22.
//

import SwiftUI

struct SideMenuHeader: View {
    @Binding var isShowingMenu: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button {
                withAnimation(.spring()) {
                    isShowingMenu.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    
                    .padding()
            }

            
            VStack(alignment: .leading) {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .padding(.bottom)
                
                Text("Name Surname")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                HStack {
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct SideMenuHeader_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeader(isShowingMenu: .constant(true))
    }
}
