//
//  CatalogViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 26/03/2023.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        Product(id: "1",
                title: "Quatro Formaggi",
                imageUrl: "NOt found",
                price: 45,
                descript: "Wegeterian Pizza"),
        
        Product(id: "2",
                title: "Margherita",
                imageUrl: "NOt found",
                price: 50,
                descript: "Wegeterian Pizza"),
        
        Product(id: "3",
                title: "Diavola",
                imageUrl: "NOt found",
                price: 55,
                descript: "Wegeterian Pizza"),
        
        Product(id: "4",
                title: "Spinacci",
                imageUrl: "NOt found",
                price: 65,
                descript: "Wegeterian Pizza"),
        
    ]
    
   @Published var pizzas = [
        Product(id: "1",
                title: "Quatro Formaggi",
                imageUrl: "NOt found",
                price: 45,
                descript: "Wegeterian Pizza"),
        
        Product(id: "2",
                title: "Margherita",
                imageUrl: "NOt found",
                price: 50,
                descript: "Wegeterian Pizza"),
        
        Product(id: "3",
                title: "Diavola",
                imageUrl: "NOt found",
                price: 55,
                descript: "Wegeterian Pizza"),
        
        Product(id: "4",
                title: "Spinacci",
                imageUrl: "NOt found",
                price: 65,
                descript: "Wegeterian Pizza"),
        
    ]
    func getProducts() {
        DataBaseService.shared.getProducts { result in
            switch result {
                
            case .success(let products):
                self.pizzas = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
