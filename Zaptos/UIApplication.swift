//
//  UIApplication.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 08/06/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    // To dismiss the keyboard using the X button which we provided.
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
