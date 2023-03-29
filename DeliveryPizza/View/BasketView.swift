//
//  Basket.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/03/2023.
//

import SwiftUI

struct BasketView: View {
    var viewModel: CartViewModel
    var body: some View {
        Text("Basket")
    }
}

struct Basket_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(viewModel: CartViewModel())
    }
}
