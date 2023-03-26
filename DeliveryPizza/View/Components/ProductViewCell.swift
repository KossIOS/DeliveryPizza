//
//  ProductViewCell.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 26/03/2023.
//

import SwiftUI

struct ProductViewCell: View {
    var product : Product
    var body: some View {
        VStack(spacing: 2){
            Image("cell")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                
            
            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                Text("\(product.price) $")
                    .font(.custom("AvenirNext-bold", size: 12))
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 6)
        }   .frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 4)
           
    }
}

struct ProductViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductViewCell(product: Product(id: "1",
                                         title: "Quatro Formaggi",
                                         imageUrl: "NOt found",
                                         price: 45,
                                         descript: "Wegeterian Pizza"))
    }
}
