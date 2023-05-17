//
//  MainTapBarViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 19/04/2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
