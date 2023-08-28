//
//  PositionCell.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 01/04/2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) szt")
            Text("\(position.cost) $")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Margherita", imageUrl: "MArgherita", price: 350, descript: "Wege Pizza"), count: 3))
    }
}
