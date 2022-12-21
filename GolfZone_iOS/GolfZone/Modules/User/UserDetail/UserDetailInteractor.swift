//
//  UserDetailInteractor.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation

class UserDetailInteractor: PresenterToInteractorUserDetailProtocol {
    var user: UserDetail?
    
    // MARK: Properties
    var presenter: InteractorToPresenterUserDetailProtocol?
}
