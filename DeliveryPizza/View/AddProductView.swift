//
//  AddProductView.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 20/08/2023.
//

import SwiftUI

struct AddProductView: View {
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "Margherita")!
    @State private var title = ""
    @State private var descript = ""
    @State private var price: Int? = nil
    @Environment (\.dismiss) var dissmis
    
    var body: some View {
        VStack {
            Text("Add product")
                .font(.title2.bold())
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 320)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    showImagePicker.toggle()
                }
                .cornerRadius(24)
            TextField("Name Product", text: $title)
                .padding()
            TextField("Price Product", value: $price, format: .number)
                .keyboardType(.numberPad)
                .padding()
            TextField("Description product", text: $descript)
                .padding()
            
            Button {
                guard let price = price else {
                    print("No")
                    return
                }
                
                let product = Product(id: UUID().uuidString, title: title, price: price, descript: descript)
                guard let imageData = image.jpegData(compressionQuality: 0.1) else { return }
                DataBaseService.shared.setProduct(product: product, image: imageData) { result in
                    switch result {
                        
                    case .success(let product):
                        print(product.title)
                        dissmis()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            } label: {
                Text("Save")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
