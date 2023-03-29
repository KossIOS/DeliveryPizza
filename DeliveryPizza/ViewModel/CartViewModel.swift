//
//  CartViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 30/03/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var positions = [Position]()
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}

