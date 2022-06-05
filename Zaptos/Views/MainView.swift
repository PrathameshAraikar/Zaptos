//
//  MainView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Main View!")
                    .font(.largeTitle)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
