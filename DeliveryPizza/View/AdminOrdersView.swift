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
        Text("Hello World!")
            .background(Color.mint)
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
