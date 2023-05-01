//
//  DataBaseService.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 29/04/2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    static let shared = DatabaseService()
    private let dataBase = Firestore.firestore()
    private var usersRef: CollectionReference {
        return dataBase.collection("users")
    }
    
    private init() { }
    
    func createUser(user: KKUser, completion: @escaping (Result<KKUser, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) {error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
}
