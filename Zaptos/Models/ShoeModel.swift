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
    var id = UUID().uuidString
}

