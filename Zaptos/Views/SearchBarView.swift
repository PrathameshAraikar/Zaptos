//
//  SearchBarView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 08/06/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchBarText: String
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(
                        searchBarText.isEmpty ? .accentColor.opacity(0.5) : .accentColor
                    )
                
                TextField("Search by name or brand...", text: $searchBarText)
                    .foregroundColor(.accentColor)
                    .disableAutocorrection(true)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .offset(x: 10)
                            .foregroundColor(.accentColor)
                            .opacity(
                                searchBarText.isEmpty ? 0 : 1
                            )
                            .onTapGesture {
                                UIApplication.shared.endEditing()
                                searchBarText = ""
                            }
                    }
            }
            .padding()
            .font(.headline)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding()
            .shadow(radius: 10)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchBarText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            SearchBarView(searchBarText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
