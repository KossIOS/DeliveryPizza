//
//  OrderView.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 01/08/2023.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel: OrderViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("\(viewModel.user.phone)")
                .bold()
            Text("\(viewModel.user.phone)")
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in PositionCell(position: position)
                }
                Text("Totaly: \(viewModel.order.cost) $")
                    .bold()
            }
        }.padding()
            .onAppear {
                viewModel.getUserData()
            }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "New")))
    }
}
