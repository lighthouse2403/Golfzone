//
//  UserEntity.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//

import Foundation

class UserListEntity: InteractorToEntityUserListProtocol {
    
    func getUser(completionHandler: @escaping (Result<[UserDetail], ServiceError>) -> Void) {
        UserAPI.shared.getUserList(completionHandler: completionHandler)
    }
}
