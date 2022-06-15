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
    @State var totalAmountArray: [Int] = []
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
                        
                        VStack {
                            Spacer()
                            HStack {
                                Text("Total Amount: ")
                                Spacer()
    //                            Text("₹\(10000)")
                                    Text("₹\(vm.totalAmount)")
                                    .fontWeight(.semibold)
                            }
                            .font(.title2)
                            .foregroundColor(.accentColor)
                            .padding()
                            
                            NavigationLink {
                                Text("CHECKOUT SCREEN")
                            } label: {
                                Text("Checkout")
                                    .foregroundColor(Color("BackgroundColor"))
                                    .font(.system(size: 22))
                                    .fontWeight(.semibold)
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("DP Color"))
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            }
                            .padding()
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
        let currentUser = auth.currentUser?.uid ?? ""
        
        db.collection("All Carts").document(currentUser + "_cart").collection("cart").addSnapshotListener { querySnapshot, error in
            
            cartArray = []
            if let e = error {
                print("There was an error in retrieving data \(e.localizedDescription)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
//                        print(doc.documentID)
//                        let itemId = doc.documentID
                        let data = doc.data()
                        if
                            let imageurl = data["imageurl"] as? String,
                            let price = data["price"] as? Int,
                            let title = data["title"] as? String,
                            let shoeSize = data["shoeSize"] as? Int,
                            let quantity = data["quantity"] as? Int,
                            let itemId = doc.documentID as? String
                                
                        {
                            let newShoe = ShoeModel(imageurl: imageurl, price: price, title: title, shoeSize: shoeSize, quantity: quantity, id: itemId)
                            
                            self.cartArray.append(newShoe)
//                            calculateTotalAmountAdd(cartArray: cartArray)
                        } else {
                            print("Error printing data!!")
                        }
                    }
                }
            }
        }
         
         db.collection("All Carts").document(currentUser + "_cart").collection("totalAmount").order(by: "timestamp", descending: true).addSnapshotListener { querySnapshot, error in
             
             vm.totalAmount = 0
             totalAmountArray = []
             if let e = error {
                 print("There was an error in retrieving data \(e.localizedDescription)")
             } else {
                 if let snapshotDocuments = querySnapshot?.documents {
                     for doc in snapshotDocuments {
                         let data = doc.data()
                         if let t_amount = data["total_amount"] as? Int {
                             self.totalAmountArray.append(t_amount)
                             vm.totalAmount = totalAmountArray.first ?? 0
//                             print(totalAmountArray)
                         } else {
                             print("Error getting total amount")
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
