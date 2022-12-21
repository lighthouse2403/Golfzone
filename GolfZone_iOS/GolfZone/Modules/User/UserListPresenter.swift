//
//  UserListPresenter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation

class UserListPresenter: ViewToPresenterUserListProtocol {
    // MARK: Properties
    var view: PresenterToViewUserListProtocol?
    var interactor: PresenterToInteractorUserListProtocol?
    var router: PresenterToRouterUserListProtocol?
}

extension UserListPresenter: InteractorToPresenterUserListProtocol {
    
}
