//
//  Temp1.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 12/06/22.
//

import SwiftUI

struct Temp1: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                LinearGradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(
                        Text("Hello World")
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                    )
            }
        }
    }
}

struct Temp1_Previews: PreviewProvider {
    static var previews: some View {
        Temp1()
    }
}
