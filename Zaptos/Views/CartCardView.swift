//
//  CartCardView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 09/06/22.
//

import SwiftUI

struct CartCardView: View {
    
    var shoe: ShoeModel
    @State var quantity: Int = 1
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(height: 250)
                    .overlay {
                        let url = URL(string: shoe.imageurl)
                        
                        HStack {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let returnedImage):
                                    returnedImage
                                        .resizable()
                                        .frame(
                                            width: 200,
                                            height: 200)
                                        .cornerRadius(30)
                                    
                                case .failure:
                                    Image(systemName: "questionmark")
                                        .font(.headline)
                                default:
                                    Image(systemName: "questionmark")
                                        .font(.headline)
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text(shoe.title)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .padding(.bottom)
                                
                                HStack {
                                    Text("Price: ")
                                    
                                    Text(shoe.price)
                                        .font(.headline)
                                }
                                .foregroundColor(.black)
                                .padding(.bottom)
                                
                                HStack {
                                    Text("Size: ")
                                    Text("\(shoe.shoeSize!)")
                                        .font(.headline)
                                    
                                }
                                .foregroundColor(.black)
                                .padding(.bottom)
                                
                                HStack {
                                    Text("Quantity: ")
                                    Text("\(quantity)")
                                        .font(.headline)
//                                    if let quantity = shoe.quantity {
//                                        Text("\(quantity)")
//                                            .font(.headline)
//                                    }
                                }
                                .foregroundColor(.black)
                                
                                
                                Stepper("") {
                                    showAlert.toggle()
                                } onDecrement: {
                                    if quantity > 1 {
                                        quantity -= 1
//                                       print(quantity)
                                    }
                                    
//                                    if var quantity = shoe.quantity {
//                                        if quantity > 1 {
//                                            quantity -= 1
//                                            print(quantity)
//                                        }
//                                    }
                                }
                                .frame(width: 90)
                                .alert("Repeat last used size?",
                                       isPresented: $showAlert) {
                                    Button(role: .destructive) {
                                        if quantity < 10 {
                                            quantity += 1
//                                            print(quantity)
                                        }
                                        
//                                        if var quantity = shoe.quantity {
//                                            if quantity < 10 {
//                                                quantity += 1
//                                                print(quantity)
//                                            }
//                                        }
                                    } label: {
                                        Text("Repeat Last")
                                    }
                                    
                                    Button(role: .cancel) {
                                        
                                    } label: {
                                        Text("Cancel")
                                    }


                                }

//                                Stepper(value: $quantity, in: 1...10) {}
//                                    .frame(width: 90)
//                                    .foregroundColor(.black)
                                
                            }
//                            .shadow(radius: 10)
                            
                            Spacer()
                        }
                        
                        
                    }
                    .shadow(radius: 10)
            }
            .padding(.horizontal)
            
            VStack(alignment: .trailing) {
                NavigationLink {
                    DescriptionView(shoe: shoe)
                } label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .padding()
                        
                }
            }
            .padding(.leading, 350)
            
        }
    }
}

struct CartCardView_Previews: PreviewProvider {
    static var previews: some View {
            CartCardView(shoe: ShoeModel(imageurl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/2038d7ff-8926-4d65-a014-6d7151588e4f/nikecourt-zoom-vapor-cage-4-rafa-hard-court-tennis-shoes-cS7wct.png",
                price: "₹13,495", title: "NikeCourt Zoom Vapor Cage 4 Rafa", shoeSize: 10, quantity: 1))
    }
}
