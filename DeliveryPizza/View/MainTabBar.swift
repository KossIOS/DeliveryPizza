//
//  MainTabBar.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/03/2023.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
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
            
            BasketView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart.fill")
                        Text("Basket")
                    }
                }
            
            ProfileView(vieModel: ProfileViewModel(profile: KKUser(id: "", name: "", phone: 0000000000, address: "")))
                .tabItem{
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                }
        }
    }
}

