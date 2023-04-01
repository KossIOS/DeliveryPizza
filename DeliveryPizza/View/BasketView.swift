//
//  Basket.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/03/2023.
//

import SwiftUI

struct BasketView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions(content: {
                        Button {
                            viewModel.positions.removeAll { pos in pos.id == position.id
                            }
                        } label: {
                            Text("Delete")
                        } .tint(.red)
                    })
            }
            .listStyle(.plain)
            .navigationTitle("Basket")
            
            HStack {
                Text("Total")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) $")
                    .fontWeight(.bold)
            }.padding()
            
            HStack(spacing: 24) {
                Button {
                    print("Cancel")
                } label: {
                    Text("Cancel")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 150)
                        .background(Color.red)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                }
                
                Button {
                    print("Order")
                } label: {
                    Text("Order")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                }
            }
        }
    }
}

struct Basket_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(viewModel: CartViewModel.shared)
    }
}
