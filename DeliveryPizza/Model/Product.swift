//
//  Product.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 26/03/2023.
//

import Foundation

struct Product {
    var id: String
    var title: String
//    var imageUrl: String
    var price: Int
    var descript: String

//    var ordersCount: Int
//    var isRecommend: Bool
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["price"] = self.price
        repres["descript"] = self.descript
        
        return repres
    }
}

