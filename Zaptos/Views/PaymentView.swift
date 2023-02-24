//
//  PaymentView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 16/06/22.
//

import SwiftUI

struct PaymentView: View {
    
    @StateObject var payvm: PaymentViewModel = PaymentViewModel()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(alignment: .leading) {
                Section {
                    CODButtonView()
                    CreditDebitButtonView(vm: payvm)
                    UPIButtonView()
                    NetbankingButtonView()
                } header: {
                    Text("PAYMENT OPTIONS")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                BillView()
            }
            .padding()

        }
        .navigationTitle("Payment")
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}

struct PaymentOptionsView: View {
    
    let title: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.2))
            .frame(height: 50)
            .overlay {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.accentColor)
                }
                .padding()
            }
    }
}

struct PriceDetailsView: View {
    
    let title: String
    let amount: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.accentColor)
            
            Spacer()
            
            Text("₹\(amount)")
                .font(.headline)
                .foregroundColor(.accentColor)
        }
        .padding(.horizontal)
    }
}

struct TotalAmountView: View {
    var body: some View {
        HStack {
            Text("Total Amount")
                .font(.title2)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text("₹\(12000)")
                .font(.title2)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
        }
    }
}

struct BillView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Price Details")
                .font(.title2)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
            
            PriceDetailsView(title: "Total Price", amount: 12000)
            PriceDetailsView(title: "Discount", amount: 0)
            PriceDetailsView(title: "Taxes", amount: 0)
            PriceDetailsView(title: "Delivery Charges", amount: 0)
            
            Divider()
                .overlay(Color.accentColor)
            
            TotalAmountView()
        }
    }
}

struct CODButtonView: View {
    var body: some View {
        NavigationLink {
            Text("COD Screen")
        } label: {
            PaymentOptionsView(title: "Cash On Delivery", imageName: "indianrupeesign.circle.fill")
        }
        .padding(.bottom)
    }
}

struct CreditDebitButtonView: View {
    
    let vm: PaymentViewModel
    @Environment(\.openURL) var openURL

    var body: some View {
        Button {
            vm.getPaymentLink()
            print(vm.paymentLink.url)
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                openURL(URL(string: vm.paymentLink.url) ?? URL(string: "https://www.google.co.in")!)
            }
        } label: {
            PaymentOptionsView(title: "Credit/Debit Card", imageName: "creditcard")
        }
        .padding(.bottom)
    }
}

struct UPIButtonView: View {
    var body: some View {
        NavigationLink {
            Text("UPI Screen")
        } label: {
            PaymentOptionsView(title: "UPI", imageName: "qrcode")
        }
        .padding(.bottom)
    }
}

struct NetbankingButtonView: View {
    var body: some View {
        NavigationLink {
            Text("Net Banking Screen")
        } label: {
            PaymentOptionsView(title: "Net Banking", imageName: "network")
        }
        .padding(.bottom)
    }
}
