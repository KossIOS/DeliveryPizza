//
//  ProfileViewModel.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 03/05/2023.
//

import Foundation
class ProfileViewModel: ObservableObject {
    @Published var profile: KKUser
    
    init(profile: KKUser) {
        self.profile = profile
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
            case.success(let user):
                print(user.name)
            case.failure(let error):
                print("Error data send \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
            case.success(let user):
                self.profile = user
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
