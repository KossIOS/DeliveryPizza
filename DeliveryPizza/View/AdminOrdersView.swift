//
//  AdminOrdersView.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 09/06/2023.
//

import SwiftUI

struct AdminOrdersView: View {
    @StateObject var viewModel = AdminOrdersViewModel()
    @State private var isOrderViewShow = false
    @State private var isShowAuthView = false
    @State private var isShowAddProductView = false
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    AuthServise.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Exit")
                        .foregroundColor(.red)
                }
                Spacer()
                Button {
                    isShowAddProductView.toggle()
                } label: {
                    Text("Add Product")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                Spacer()
                Button {
                    viewModel.getOrders()
                } label: {
                    Text("Update")
                }
            }.padding()
            
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }.listStyle(.plain)
                .onAppear{
                    viewModel.getOrders()
                }
                .sheet(isPresented: $isOrderViewShow) {
                    let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                    OrderView(viewModel: orderViewModel)
                }
        }.fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
        .sheet(isPresented: $isShowAddProductView){
            AddProductView()
        }
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
