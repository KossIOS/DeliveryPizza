//
//  StorageSerive.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/08/2023.
//

import Foundation
import FirebaseStorage

class StorageService {
    static let shared = StorageService()
    private init () {}
    
    private var storage = Storage.storage().reference()
    private var productRef: StorageReference { storage.child("products")}
    
    func upload(id: String, image: Data, completion: @escaping (Result<String, Error>) -> ()) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        
        productRef.child(id).putData(image, metadata: metadata) {metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success("Size received image : \(metadata.size)"))
        }
    }
}

