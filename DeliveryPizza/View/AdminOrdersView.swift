//
//  AdminOrdersView.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 09/06/2023.
//

import SwiftUI

struct AdminOrdersView: View {
    @StateObject var viewModel = AdminOrdersViewModel()
    var body: some View {
        List {
            ForEach(viewModel.orders, id: \.id) { order in
                OrderCell(order: order)
                
            }
        }.listStyle(.plain)
            .onAppear {
                viewModel.getOrders()
            }
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
