//
//  OrderViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 01/08/2023.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: Order
    @Published var user = KKUser(id: "", name: "", phone: 0, address: "")
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        DataBaseService.shared.getProfile(by: order.userID) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
