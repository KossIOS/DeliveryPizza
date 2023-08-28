//
//  ProductDetailVIew.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 26/03/2023.
//

import SwiftUI

struct ProductDetailVIew: View {
    
    var viewModel: ProductDetailViewModel
    @State var size = "Little"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                
                Image(uiImage: self.viewModel.image! )
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 260)
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.title2.bold())
                    Spacer()
                    Text("\(viewModel.getPrixe(size: self.size))$")
                        .font(.title2)
                }.padding(.horizontal)
                
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(.vertical, -12)
                
                HStack {
                    Stepper("Amount", value: $count, in: 1...10)
                    
                    Text("\(self.count)")
                        .padding(.leading, 18)
                }.padding(.horizontal, 16)
                
        
                Picker("Size Pizza", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
            }

            Button {
                
                var position = Position(id: UUID().uuidString, product: viewModel.product, count: self.count)
                position.product.price = viewModel.getPrixe(size: size)
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Text("To basket")
                    .padding()
                    .padding(.horizontal, 40)
                    .cornerRadius(30)
                    .foregroundColor(.black)
                    .font(.title3.bold())
                    .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
            }
            .onAppear{
                self.viewModel.getImage()
            }
            Spacer()
        }
    }
}
struct ProductDetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailVIew(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                             title: "Margherita",
                                                                             imageUrl: "None",
                                                                             price: 45,
                                                                             descript: "Wegeterian Pizza")
        ))
    }
}
