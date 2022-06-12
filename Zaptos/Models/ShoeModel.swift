//
//  ShoeModel.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 06/06/22.
//

import Foundation

struct ShoeModel: Codable, Identifiable {
    let imageurl: String
    let price, title: String
    let shoeSize: Int?
    var quantity: Int?
    var id = UUID().uuidString
}


//var checkoutShoes: [ShoeModel] = []
