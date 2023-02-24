//
//  DescriptionView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 09/06/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct DescriptionView: View {
    
    @EnvironmentObject var vm: ShoeViewModel
    @State var showConfirmation: Bool = false
    @State var shoeSize: Int = 0
    @State var quantity: Int = 1
    @State var cartArray: [Int] = []
    let shoe: ShoeModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack {
                let url = URL(string: shoe.imageurl)
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let returnedImage):
                        returnedImage
                            .resizable()
                            .frame(
                                width: UIScreen.main.bounds.width,
                                height: 350)
                            .cornerRadius(30)
                        
                    case .failure:
                        Image(systemName: "questionmark")
                            .font(.headline)
                    default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                    }
                }
                
                HStack {
                    Text(shoe.title)
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.leading, 25)
                        .padding(.bottom)
                    
                    Spacer()
                }
                
                HStack {
                    Text("Total price: ")
                    Text("₹\(shoe.price)")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .font(.title2)
                .foregroundColor(.white)
                .padding(.leading, 25)
                .padding(.bottom)
                
                HStack {
                    Text("Size: ")
                    Picker(selection: $shoeSize) {
                        ForEach(5..<12) { size in
                            Text("\(size)")
                                .font(.title2)
                                .fontWeight(.semibold)
//                                .foregroundColor(.white)
                                .tag("\(size)")
                        }
                    } label: {
                        Text("Picker")
                    }
                    .frame(height: 20)
                    .pickerStyle(.wheel)
                    
                    Spacer()
                    
                }
                .font(.title2)
                .foregroundColor(.white)
                .padding(.leading, 25)
                .padding(.bottom, 90)
                
                HStack {
                    Text("Quantity: ")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Text("\(quantity)")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.trailing, 50)
                    
                    Stepper(value: $quantity, in: 1...10) {}
                        .frame(width: 95)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                    Spacer()
                }
                .padding(.leading, 25)
                
                Button {
                    showConfirmation.toggle()
                } label: {
                    Text("Add to Cart")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color("DP Color"))
                        .cornerRadius(16)
                        .shadow(color: .accentColor, radius: 4, x: 0, y: 0)
                        .padding(.top)
                        .padding(.horizontal, 30)
                }
                .confirmationDialog("Are You Sure?", isPresented: $showConfirmation, titleVisibility: .visible) {
                    Button(role: .none) {
                        addDataToFirebase(shoe: shoe)
                        cartArray.append(shoe.price * quantity)
                        vm.calculateTotalAmountAdd(cartArray: cartArray)
                    } label: {
                        Text("OK")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    
    func addDataToFirebase(shoe: ShoeModel) {
        
        let db = Firestore.firestore()
        let auth = Auth.auth()
        let currentUser = auth.currentUser
        
        db.collection("All Carts").document(currentUser!.uid + "_cart").collection("cart").addDocument(data: [
            "imageurl": shoe.imageurl,
            "price": (shoe.price * quantity),
            "title": shoe.title,
            "shoeSize": (shoeSize + 5),
            "quantity": quantity,
            "id": shoe.id
            
        ]) { error in
            if let e = error {
                print(e.localizedDescription)
                print("There was an error in saving the data in Firestore")
            } else {
                print("Successfully saved data")
            }
        }
        
    }
}



struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(shoeSize: 7, shoe: ShoeModel(imageurl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/2038d7ff-8926-4d65-a014-6d7151588e4f/nikecourt-zoom-vapor-cage-4-rafa-hard-court-tennis-shoes-cS7wct.png",
                                                     price: 13495, title: "NikeCourt Zoom Vapor Cage 4 Rafa", shoeSize: nil, quantity: nil))
        .environmentObject(ShoeViewModel())
    }
    
}
