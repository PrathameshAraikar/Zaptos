//
//  MainView.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 05/06/22.
//

import SwiftUI

struct MainView: View {
    
    @State var isShowingMenu: Bool = false
    @EnvironmentObject var vm: ShoeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                if isShowingMenu {
                    SideMenuView(isShowingMenu: $isShowingMenu)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    FlagshipView(brandName: "Nike", shoeArray: vm.allNikeShoes)
                    FlagshipView(brandName: "Adidas", shoeArray: vm.allAdidasShoes)
                    FlagshipView(brandName: "Puma", shoeArray: vm.allPumaShoes)
                }
                .cornerRadius(isShowingMenu ? 25 : 0)
                .offset(
                    x: isShowingMenu ? 300 : 0,
                    y: isShowingMenu ? 44 : 0)
                .scaleEffect(isShowingMenu ? 0.8 : 1)
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.spring()) {
                            isShowingMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SearchView()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .padding(.trailing, 10)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CartView()
                    } label: {
                        Image(systemName: "cart")
                    }

//                    Button {
//
//                    } label: {
//                        Image(systemName: "cart")
//                    }
                }
            }
        }
    }
}

struct FlagshipView: View {
    
    let brandName: String
    let shoeArray: [ShoeModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(brandName)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(shoeArray) { shoe in
                        NavigationLink {
                            DescriptionView(shoe: shoe)
                        } label: {
                            ShoeCardView(shoe: shoe)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.trailing, 30)
                }
            }
        }
        .padding()
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color("BackgroundColor").opacity(0.8))
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(#colorLiteral(red: 0.8335181475, green: 0.725478828, blue: 0.4544145465, alpha: 1)))]
        
        navigationBar.standardAppearance = appearance
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ShoeViewModel())
    }
}

//RoundedRectangle(cornerRadius: 20)
//    .fill(Color.accentColor.opacity(0.5))
//    .frame(width: 200, height: 250)
//    .overlay(content: {
//        VStack(spacing: 10.0) {
//            Text(shoe.title)
//                .foregroundColor(.accentColor)
//
//            Text(shoe.price)
//                .foregroundColor(.accentColor)
//        }
//    })
//    .padding(.trailing, 40)

//ForEach(0..<15) { rect in
//    RoundedRectangle(cornerRadius: 20)
//        .fill(Color.accentColor.opacity(0.5))
//        .frame(width: 200, height: 250)
//        .padding(.trailing, 40)
//
//}

// This is an extension of Navigation View from UI Kit
// with the help of this func we can change the backgroundColor of the navBar and textColor of navBar as required...

// This function is used to change the Navigation Title ONLY...

//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(#colorLiteral(red: 0.8335181475, green: 0.725478828, blue: 0.4544145465, alpha: 1)))]
//    }

