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
    var currentUser: User? {
        return auth.currentUser
    }
    
    func  singUp(email : String, password: String, completion:  @escaping (Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                let kkUser = KKUser(id:result.user.uid,
                                    name: "",
                                    phone: 0,
                                    adress: "")
                DatabaseService.shared.createUser(user: kkUser) { resultDB in
                    switch resultDB {
                    case.success(_):
                        completion(.success(result.user))
                    case.failure(let error):
                        completion(.failure(error))
                        
                    }
                }
                
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func singIn(email : String, password: String, completion:  @escaping (Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}

