//
//  MainTabBar.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/03/2023.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        
        TabView {
            CatalogView()
                .tabItem {
                    VStack {
                        Image(systemName: "book.circle")
                        Text("Catalog")
                    }
                }
            
            BasketView()
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
        MainTabBar()
    }
}
