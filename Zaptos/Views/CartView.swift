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
            if let cartShoes =  vm.shoesInCart {
                if cartShoes.isEmpty {
                    EmptyCartView()
                } else {
                    ScrollView(.vertical, showsIndicators: true) {
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
        VStack(alignment: .center) {
            Image(systemName: "cart.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.accentColor)
                .padding(.top)
            
            Text("Empty Cart!!")
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
                .padding()
            
            Text("Click Add to Cart button to view items here...")
                .foregroundColor(.accentColor)
                .fontWeight(.light)
            
        }
    }
}
