//
//  UserDetailPresenter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation

class UserDetailPresenter: ViewToPresenterUserDetailProtocol {
    // MARK: Properties
    var view: PresenterToViewUserDetailProtocol?
    var interactor: PresenterToInteractorUserDetailProtocol?
    var router: PresenterToRouterUserDetailProtocol?
}

extension UserDetailPresenter: InteractorToPresenterUserDetailProtocol {
    
}
