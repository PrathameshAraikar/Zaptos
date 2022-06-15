//
//  ShoeViewModel.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 06/06/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

class ShoeViewModel: ObservableObject {

    @Published var allAdidasShoes: [ShoeModel] = []
    @Published var allNikeShoes: [ShoeModel] = []
    @Published var allPumaShoes: [ShoeModel] = []
    @Published var shoesInCart: [ShoeModel]? = []
    @Published var searchBarText: String = ""
    @Published var totalAmount: Int = 0

    init() {
        getAdidasData()
        getNikeData()
        getPumaData()
    }

    func getAdidasData() {
        allAdidasShoes.append(
            ShoeModel(imageurl:"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a9cf6d9e5fd048c181b4ad7b01818f17_9366/Humanrace_Sichona_Shoes_Black_GX3032_01_standard.jpg",
                price: 16999, title: "Humanrace Sichona Shoes", shoeSize: nil, quantity: nil))
        
        allAdidasShoes.append(
            ShoeModel(imageurl:"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3a3d0fb47beb4b86b6a3ad7800a3ae02_9366/Ultraboost_22_Shoes_Blue_GX3061_01_standard.jpg",
                price: 17999, title: "Ultraboost 22 Shoes", shoeSize: nil, quantity: nil))
        
        allAdidasShoes.append(
            ShoeModel(imageurl:"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/643d22b6922040c0bd81ae2a00fc3890_9366/X_Speedflow+_Firm_Ground_Boots_Red_GW7436_01_standard.jpg",
                      price: 29999, title: "X Speedflow+ Firm Ground Boots", shoeSize: nil, quantity: nil)
        )
        
        allAdidasShoes.append(
            ShoeModel(imageurl: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d099954614dd457aba05ab07011c91ae_9366/Crazy_BYW_Pharrell_Williams_Shoes_Black_EG9919_01_standard.jpg",
                      price: 23999, title: "Crazy Byw Pharrell William Shoes", shoeSize: nil, quantity: nil)
        )
        
        allAdidasShoes.append(
            ShoeModel(imageurl: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d8e171b187c24648918aac2c001bc85c_9366/HU_NMD_Shoes_Orange_GY0095_01_standard.jpg",
                      price: 21999, title: "Adidas 4DWD X Parley Shoes", shoeSize: nil, quantity: nil)
        )
        
        allAdidasShoes.append(
            ShoeModel(imageurl: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bf2ee64c399944febe12acb800c3cefd_9366/Ultraboost_4.0_DNA_Shoes_Black_GW2293_01_standard.jpg",
                      price: 16999, title: "Ultraboost 4.0 DNA Shoes", shoeSize: nil, quantity: nil)
        )
        
        allAdidasShoes.append(
            ShoeModel(imageurl: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/50701b6a4fd4428388b6ae2a00fd12d1_9366/Adizero_Adios_Pro_3_Shoes_Black_GX6251_01_standard.jpg",
                      price: 21999, title: "Adizero Adios Pro 3 Shoes", shoeSize: nil, quantity: nil)
        )
        
        allAdidasShoes.append(
            ShoeModel(imageurl: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6cab49cf5fb44136a184adef00cb25ae_9366/Rich_Mnisi_Ultraboost_22_Shoes_Black_GW0944_01_standard.jpg",
                      price: 18999, title: "Rich Mnisi Ultraboost 22 Shoes", shoeSize: nil, quantity: nil)
        )

        allAdidasShoes.append(
            ShoeModel(imageurl: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d3ffdc15c6fc4261b8b0adeb002dfb49_9366/Ultraboost_Supernova_DNA_Shoes_White_GY5374_01_standard.jpg", price: 17999, title: "Ultraboost Supernova DNA Shoes", shoeSize: nil, quantity: nil)
        )

        allAdidasShoes.append(
            ShoeModel(imageurl: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d8e171b187c24648918aac2c001bc85c_9366/HU_NMD_Shoes_Orange_GY0095_01_standard.jpg",
                      price: 21999, title: "HU NMD Shoes", shoeSize: nil, quantity: nil)
        )
    }
    func getNikeData() {
        
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/2038d7ff-8926-4d65-a014-6d7151588e4f/nikecourt-zoom-vapor-cage-4-rafa-hard-court-tennis-shoes-cS7wct.png",
                      price: 13495, title: "NikeCourt Zoom Vapor Cage 4 Rafa", shoeSize: nil, quantity: nil)
        )
        
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/31c53347-5ba0-4683-898d-7cca02ae38bb/air-max-95-essential-shoe-6n9HLv.png",
                      price: 16995, title: "Nike ZoomX Invincible Run Flyknit 2", shoeSize: nil, quantity: nil)
        )
        
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8511d7e9-313d-4bae-ac25-bcddf2db5d12/zoomx-invincible-run-flyknit-2-road-running-shoes-xrCMmF.png", price: 16995, title: "Nike ZoomX Invincible Run Flyknit 2", shoeSize: nil, quantity: nil)
        )
        
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/718eac0e-aa35-4866-921e-79369dc6a22b/air-jordan-xxxvi-se-basketball-shoe-LG8Xx7.png",
                      price: 17595, title: "Air Jordan XXXVI SE", shoeSize: nil, quantity: nil)
        )
        
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f128b5bf-b604-43cc-a895-87929dd6f5e6/lebron-ix-shoes-2qvn3w.png", price: 20495, title: "Nike LeBron IX", shoeSize: nil, quantity: nil)
        )
        
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6362ebb8-ad24-428c-9b2b-293e99410f42/go-flyease-shoe-5nWPkx.png", price: 10295, title: "Nike Go FlyEase", shoeSize: nil, quantity: nil)
        )
  
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/44d6b95b-d0d2-4446-b694-6272c9a0b5fd/lebron-9-shoes-j6jK09.png", price: 19695, title:  "Nike LeBron 9", shoeSize: nil, quantity: nil)
        )

        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/3afd7789-421a-4852-98f2-9554eb736014/pg-6-ep-basketball-shoes-9KkDtr.png",
                      price: 9695, title: "PG 6 EP", shoeSize: nil, quantity: nil)
        )
 
        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/7770e4cc-d06a-41ff-845d-5936cd1f382e/kd15-ep-basketball-shoes-9K6BpD.png",
                      price: 13995, title: "KD15 EP", shoeSize: nil, quantity: nil)
        )

        allNikeShoes.append(
            ShoeModel(imageurl: "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ba0c073f-88e7-45f6-9834-fc89ac2622db/overbreak-shoes-2TgCBF.png", price: 12495, title: "Nike Overbreak", shoeSize: nil, quantity: nil)
        )
    }
    func getPumaData() {
        
        allPumaShoes.append(
            ShoeModel(imageurl: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/376049/02/sv01/fnd/IND/fmt/png/PWRFrame-TR-Men's-Training-Shoes",
                      price: 6999, title: "PWRFrame TR Men's Training Shoes", shoeSize: nil, quantity: nil)
        )
  
        allPumaShoes.append(
            ShoeModel(imageurl: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/195170/01/sv01/fnd/IND/fmt/png/Magnify-Nitro-Men's-Running-Shoes",
                      price: 12999, title: "Magnify Nitro Men's Running Shoes", shoeSize: nil, quantity: nil)
        )

        allPumaShoes.append(
            ShoeModel(imageurl: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/306806/01/sv01/fnd/IND/fmt/png/Ferrari-IONF-Sneakers",
                      price:  20999, title: "Ferrari IONF Sneakers", shoeSize: nil, quantity: nil)
        )

        allPumaShoes.append(
            ShoeModel(imageurl: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/105606/05/sv01/fnd/IND/fmt/png/KING-Platinum-CMEVA-Men's-FG/AG-Football-Boots",
                      price: 15299, title: "KING Platinum Men'sFootball Boots", shoeSize: nil, quantity: nil)
        )

        allPumaShoes.append(
            ShoeModel(imageurl: "https://in.puma.com/in/en/pd/mb1-galaxy-mens-basketball-shoes/376677.html?dwvar_376677_color=07#",
                      price: 11999, title: "MB1 Galaxy Men's Basketball Shoes", shoeSize: nil, quantity: nil)
        )
   
        allPumaShoes.append(
            ShoeModel(imageurl: "https://in.puma.com/in/en/pd/fusion-nitro-unisex-sneakers/195587.html?dwvar_195587_color=04#",
                      price: 11999, title: "Fusion Nitro Unisex Sneakers", shoeSize: nil, quantity: nil)
        )
   
        allPumaShoes.append(
            ShoeModel(imageurl: "https://in.puma.com/in/en/pd/trc-blaze-court-basketball-mens-shoes/376582.html?dwvar_376582_color=02#",
                      price:  10999, title: "TRC Blaze Basketball Men's Shoes", shoeSize: nil, quantity: nil)
        )
        
        allPumaShoes.append(
            ShoeModel(imageurl: "https://in.puma.com/in/en/pd/ultra-1.3-football-boots/106477.html?dwvar_106477_color=04#",
                      price:  10199, title: "ULTRA 1.3 Football Boots", shoeSize: nil, quantity: nil)
        )
       
        allPumaShoes.append(
            ShoeModel(imageurl: "https://in.puma.com/in/en/pd/bmw-m-motorsport-mirage-sport-mens-sneakers/307113.html?dwvar_307113_color=01#",
                      price: 9999, title: "BMW M Motorsport Men's Sneakers", shoeSize: nil, quantity: nil)
        )
       
        allPumaShoes.append(
            ShoeModel(imageurl: "https://in.puma.com/in/en/pd/ferrari-a3rocat-mens-sneakers/306856.html?dwvar_306856_color=02#",
                      price: 9999, title: "Ferrari A3ROCAT Men's Sneakers", shoeSize: nil, quantity: nil)
        )
    }
    func calculateTotalAmountAdd(cartArray: [Int]) {
        for price in cartArray {
            totalAmount += price
        }
        addTotalAmountToFirebase(totalAmount: totalAmount)
    }
    
    func calculateTotalAmountSubtract(cartArray: [Int]) {
        for price in cartArray {
            totalAmount -= price
        }
        addTotalAmountToFirebase(totalAmount: totalAmount)
    }
    
    func addTotalAmountToFirebase(totalAmount: Int) {
        let db = Firestore.firestore()
        let auth = Auth.auth()
        let currentUser = auth.currentUser
        
        db.collection("All Carts").document(currentUser!.uid + "_cart").collection("totalAmount").addDocument(data: [
            "total_amount": totalAmount,
            "timestamp": Date().timeIntervalSince1970
        ]) { error in
            if let e = error {
                print(e.localizedDescription)
                print("There was an error in saving the total_amount in Firestore")
            } else {
                print("Successfully saved total_amount")
            }
        }
    }
}

//₹
