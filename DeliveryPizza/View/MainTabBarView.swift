//
//  MainTabBar.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/03/2023.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        
        TabView {
            NavigationView {
                
                CatalogView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "book.circle")
                    Text("Catalog")
                }
            }
            
            BasketView(viewModel: CartViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "cart.fill")
                        Text("Basket")
                    }
                }
            
            ProfileView()
                .tabItem{
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                }
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
