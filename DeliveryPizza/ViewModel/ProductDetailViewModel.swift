//
//  ProductDetailViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 28/03/2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    @Published var sizes = ["Little", "Medium", "Biggest" ]
    @Published var count = 0
    init(product: Product) {
        self.product = product
    }
    
    func getPrixe(size: String) -> Int {
        switch size {
        case "Little": return product.price
        case "Medium": return Int(Double(product.price) * 1.25)
        case "Biggest": return Int(Double(product.price) * 1.5)
        default: return 0
        }
    }
}
