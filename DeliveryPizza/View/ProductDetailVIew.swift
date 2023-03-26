//
//  ProductDetailVIew.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 26/03/2023.
//

import SwiftUI

struct ProductDetailVIew: View {
    var product: Product
    var body: some View {
        Text("\(product.title)")
    }
}

struct ProductDetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailVIew(product: Product(id: "1",
                                           title: "Margherita",
                                           imageUrl: "None",
                                           price: 45,
                                           descript: "Wegeterian Pizza"))
    }
}
