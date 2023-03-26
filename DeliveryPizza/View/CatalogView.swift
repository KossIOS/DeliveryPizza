//
//  Catalog.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/03/2023.
//

import SwiftUI

struct CatalogView: View {
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            Section("Polular") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 12) {
                        ForEach(CatalogViewModel.shared.products, id: \.id) { item in
                            NavigationLink {
                                ProductDetailVIew(product: item)
                            } label: {
                                ProductViewCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
            }
        }.navigationBarTitle(Text("Catalog"))
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
