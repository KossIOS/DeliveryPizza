//
//  Order.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 17/05/2023.
//

import Foundation
import FirebaseFirestore

struct Order {
    var id: String = UUID().uuidString
    var userID: String
    var positions = [Position]()
    var date: Date
    var status: String
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    var representation: [String: Any] {
        var repres = [String: Any] ()
        repres["userID"] = id
        repres["name"] = userID
        repres["date"] = Timestamp(date: date)
        repres["status"] = status
        return repres
    }
}
