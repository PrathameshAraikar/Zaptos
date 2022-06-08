//
//  SideMenuOptions.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 07/06/22.
//

import SwiftUI

struct SideMenuOptions: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack {
            Image(systemName: viewModel.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding()
            
            Text(viewModel.title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
            
            Spacer()
        }
    }
}

struct SideMenuOptions_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptions(viewModel: .profile)
    }
}
