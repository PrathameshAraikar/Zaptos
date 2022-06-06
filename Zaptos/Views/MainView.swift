//
//  MainView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct MainView: View {
        
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    FlagshipView(brandName: "Adidas")
                    FlagshipView(brandName: "Nike")
                    FlagshipView(brandName: "Puma")
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // action
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // action
                    } label: {
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing, 25)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // action
                    } label: {
                    Image(systemName: "cart")
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}

struct FlagshipView: View {
    
    let brandName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(brandName)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<15) { rect in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.accentColor.opacity(0.5))
                            .frame(width: 200, height: 250)
                            .padding(.trailing, 40)
                        
                    }
                }
            }
        }
        .padding()
    }
}

// This is an extension of Navigation View from UI Kit
// with the help of this func we can change the backgroundColor of the navBar and textColor of navBar as required...

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color("BackgroundColor").opacity(0.8))
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(#colorLiteral(red: 0.8335181475, green: 0.725478828, blue: 0.4544145465, alpha: 1)))]
        
        navigationBar.standardAppearance = appearance
    }
}

// This function is used to change the Navigation Title ONLY...

//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(#colorLiteral(red: 0.8335181475, green: 0.725478828, blue: 0.4544145465, alpha: 1)))]
//    }
