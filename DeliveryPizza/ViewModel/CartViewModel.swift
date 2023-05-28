//
//  CartViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 30/03/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    private init() {}
    
    @Published var positions = [Positions]()
    var cost: Int {
        var sum = 0
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    func addPosition(_ position: Positions) {
        self.positions.append(position)
    }
}

