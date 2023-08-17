//
//  OrderStatus.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 17/05/2023.
//

import Foundation

enum OrdersStatus: String, CaseIterable {
    case new = "New"
    case cooking = "Prepare"
    case delivery = "Delivering"
    case completed = "Done"
    case cancelled = "Cancelled"
}
