//
//  SideMenuViewModel.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 07/06/22.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case cart
    case orders
    case faqs
    case aboutus
    
    var title: String {
        switch self {
        case .profile: return "Profile"
        case .cart: return "Cart"
        case .orders: return "Orders"
        case .faqs: return "FAQs"
        case .aboutus: return "About Us"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .cart: return "cart"
        case .orders: return "bag"
        case .faqs: return "questionmark.circle"
        case .aboutus: return "i.circle"
        }
    }
}
