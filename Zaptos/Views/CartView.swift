//
//  CartView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 09/06/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct CartView: View {
    
    @State var cartArray: [ShoeModel] = []
    let db = Firestore.firestore()
    @EnvironmentObject var vm: ShoeViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
                if cartArray.isEmpty {
                    EmptyCartView()
                } else {
                    ScrollView(.vertical, showsIndicators: true) {
                        ForEach(cartArray, id: \.id) { shoe in
                            CartCardView(shoe: shoe)
                                .padding(.bottom)
                        }
                    }
                }
        }
        .navigationTitle("Cart")
        .onAppear {
            loadData()
        }
    }
    
     func loadData() {
        let auth = Auth.auth()
        let currentUser = auth.currentUser
        
        db.collection("All Carts").document(currentUser!.uid + "_cart").collection("cart").addSnapshotListener { querySnapshot, error in
            
            cartArray = []
            if let e = error {
                print("There was an error in retrieving data \(e.localizedDescription)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if
                            let imageurl = data["imageurl"] as? String,
                            let price = data["price"] as? String,
                            let title = data["title"] as? String,
                            let shoeSize = data["shoeSize"] as? Int,
                            let quantity = data["quantity"] as? Int
                                
                        {
                            let newShoe = ShoeModel(imageurl: imageurl, price: price, title: title, shoeSize: shoeSize, quantity: quantity, id: UUID().uuidString)
                            
                            self.cartArray.append(newShoe)
                        } else {
                            print("Error printing data!!")
                        }
                    }
                }
            }
        }
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
