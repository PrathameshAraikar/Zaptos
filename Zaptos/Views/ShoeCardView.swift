//
//  ShoeCardView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 07/06/22.
//

import SwiftUI

struct ShoeCardView: View {
    
    let shoe: ShoeModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            let url = URL(string: shoe.imageurl)
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let returnedImage):
                    returnedImage
                        .resizable()
                        .frame(
                            width: UIScreen.main.bounds.width / 1.4,
                            height: UIScreen.main.bounds.height / 3)
                        .cornerRadius(20)
                case .failure:
                    Image(systemName: "questionmark")
                        .font(.headline)
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
            
            VStack(alignment: .leading) {
                Text(shoe.title).bold()
            }
            .frame(width: UIScreen.main.bounds.width / 1.55,
                   height: UIScreen.main.bounds.height / 40)
            .multilineTextAlignment(.leading)
            .padding()
            .background(.ultraThinMaterial)
            .padding(.top)
            .shadow(radius: 10)
            .cornerRadius(20)
        }
        .shadow(radius: 10)
    }
}

struct ShoeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeCardView(shoe:
                        ShoeModel(
                            imageurl:"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a9cf6d9e5fd048c181b4ad7b01818f17_9366/Humanrace_Sichona_Shoes_Black_GX3032_01_standard.jpg", price: 16999,
                            title: "HUMANRACE SICHONA SHOES", shoeSize: nil, quantity: nil))
    }
}
