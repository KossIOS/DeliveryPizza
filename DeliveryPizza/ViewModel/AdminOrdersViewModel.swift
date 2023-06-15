//
//  AdminOrdersViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 09/06/2023.
//

import Foundation

class AdminOrdersViewModel: ObservableObject {
    @Published var orders = [Order]()
    func getOrders() {
        DataBaseService.shared.getOrders(by: nil) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
