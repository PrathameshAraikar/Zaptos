//
//  ShippingDetailsView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 16/06/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ShippingDetailsView: View {
    
    @State var name: String = ""
    @State var mobileNo: String = ""
    @State var pincode: String = ""
    @State var address: String = ""
    @State var town: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var alertTitle: String = "Alert"
    @State var showAlert: Bool = false
    @State var showNextScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Section {
                        Group {
                            TextField("", text: $name)
                                .placeholder(when: name.isEmpty) {
                                    Text("Full Name")
                                        .foregroundColor(.gray)
                                }
                            
                            TextField("", text: $mobileNo)
                                .placeholder(when: mobileNo.isEmpty) {
                                    Text("Mobile No.")
                                        .foregroundColor(.gray)
                                }
                        }
                        .disableAutocorrection(true)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    } header: {
                        Text("Contact Details")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .textCase(.uppercase)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 20)
                
                VStack(alignment: .leading) {
                    Section {
                        Group {
                            TextField("", text: $pincode)
                                .placeholder(when: pincode.isEmpty) {
                                    Text("Pincode")
                                        .foregroundColor(.gray)
                                }
                            
                            TextField("", text: $address)
                                .placeholder(when: address.isEmpty) {
                                    Text("Address")
                                        .foregroundColor(.gray)
                                }
                            
                            TextField("", text: $town)
                                .placeholder(when: town.isEmpty) {
                                    Text("Locality/Town")
                                        .foregroundColor(.gray)
                                }
                            
                            TextField("", text: $city)
                                .placeholder(when: city.isEmpty) {
                                    Text("City/District")
                                        .foregroundColor(.gray)
                                }
                            
                            TextField("", text: $state)
                                .placeholder(when: state.isEmpty) {
                                    Text("State")
                                        .foregroundColor(.gray)
                                }
                        }
                        .disableAutocorrection(true)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    } header: {
                        Text("Address")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .textCase(.uppercase)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 20)
                
                NavigationLink(isActive: $showNextScreen) {
                    PaymentView()
                } label: {
                    Text("Proceed to Pay")
                        .foregroundColor(Color("BackgroundColor"))
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color("DP Color"))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                        .onTapGesture {
                            checkForAlert()
                        }
                }
                .alert(alertTitle, isPresented: $showAlert) {}
                
                
                Spacer()
            }
            .padding(.vertical, 30)
            .navigationTitle("Shipping Details")
        }
    }
    
    func checkForAlert() {
        if name.isEmpty {
            alertTitle = "Please enter your name 😢😢"
            showAlert.toggle()
        } else if mobileNo.isEmpty {
            alertTitle = "Please enter your mobile no"
            showAlert.toggle()
        } else if mobileNo.count < 10 {
            alertTitle = "Please enter a valid mobile no"
            showAlert.toggle()
        } else if pincode.isEmpty {
            alertTitle = "Please enter your pincode"
            showAlert.toggle()
        } else if pincode.count < 6 {
            alertTitle = "Please enter a valid pincode"
            showAlert.toggle()
        } else if address.isEmpty {
            alertTitle = "Please enter your address"
            showAlert.toggle()
        } else if town.isEmpty {
            alertTitle = "Please enter your town"
            showAlert.toggle()
        } else if city.isEmpty {
            alertTitle = "Please enter your city"
            showAlert.toggle()
        } else if state.isEmpty {
            alertTitle = "Please enter your state"
            showAlert.toggle()
        } else {
            saveUserInfoToFirebase()
            showNextScreen.toggle()
        }
    }
    
    func saveUserInfoToFirebase() {
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser
        
        db.collection("All Carts").document(currentUser!.uid + "_cart").collection("shippingDetails").addDocument(data: [
            "name": name,
            "mobileNo": mobileNo,
            "pincode": pincode,
            "address": address,
            "town": town,
            "city": city,
            "state": state
        ]) { error in
            if let e = error {
                print(e.localizedDescription)
                print("There was an error in saving the userInfo in Firestore")
            } else {
                print("Successfully saved userInfo")
            }
        }
    }
}

struct ShippingDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingDetailsView()
    }
}
