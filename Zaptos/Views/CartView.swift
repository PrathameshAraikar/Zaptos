//
//  CartView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 09/06/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var vm: ShoeViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                if let cartShoes =  vm.shoesInCart {
                    if cartShoes.isEmpty {
                        EmptyCartView()
                    } else {
                        ForEach(cartShoes, id: \.id) { shoe in
                            CartCardView(shoe: shoe)
                                .padding(.bottom)
                            
                        }
                        
                    }
                }
            }
        }
        .navigationTitle("Cart")
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ShoeViewModel())
    }
}

struct EmptyCartView: View {
    var body: some View {
        VStack {
            Image(systemName: "cart.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .foregroundColor(.accentColor)
                .padding(.top, 100)
            
            Text("Empty Cart!!")
                .font(.system(size: 55))
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
            
        }
    }
}
