//
//  ZaptosApp.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

@main
struct ZaptosApp: App {
    
    @StateObject var vm: ShoeViewModel = ShoeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
        
    }
}
