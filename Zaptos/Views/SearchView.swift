//
//  SearchView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 08/06/22.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var vm: ShoeViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                SearchBarView(searchBarText: $vm.searchBarText)
                VStack {
                    ForEach(vm.allAdidasShoes.filter({"\($0)".contains(vm.searchBarText)})) { shoe in
                        ShoeCardView(shoe: shoe)
                    }
                    .padding(.bottom, 30)
                    
                    ForEach(vm.allNikeShoes.filter({"\($0)".contains(vm.searchBarText)})) { shoe in
                        ShoeCardView(shoe: shoe)
                    }
                    .padding(.bottom, 30)
                    
                    ForEach(vm.allPumaShoes.filter({"\($0)".contains(vm.searchBarText)})) { shoe in
                        ShoeCardView(shoe: shoe)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ShoeViewModel())
    }
}

//  To filter the shoes we use a foreach loop and filter over our array (prefix search).

//  ForEach(vm.allAdidasShoes.filter({"\($0)".contains(vm.searchBarText)})) { shoe in
//        ShoeCardView(shoe: shoe)
//  }
//  .padding(.bottom, 30)
