//
//  OrderCell.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 02/06/2023.
//

import SwiftUI

struct OrderCell: View {
    
    @State var order: Order = Order(userID: "", date: Date(), status: "")
    
    var body: some View {
        
        HStack {
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundColor(.green)
        }
    }
}

//struct OrderCell_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderCell()
//    }
//}
