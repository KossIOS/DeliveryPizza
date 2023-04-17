//
//  OutService.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 17/04/2023.
//

import Foundation
import FirebaseAuth

class AuthServise {
    
    static let shared = AuthServise()
    private init() { }
    private let auth = Auth.auth()
    private var currentUser: User? {
        return auth.currentUser
    }
    
    func  singUp(email : String, password: String, completion:  @escaping (Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }
    
    
    
}
