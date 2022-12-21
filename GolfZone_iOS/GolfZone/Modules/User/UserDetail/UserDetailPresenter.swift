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
    
    func viewDidLoad() {
        guard let user = interactor?.user else {
            return
        }
        view?.setupUserDetail(user: user)
    }
}

extension UserDetailPresenter: InteractorToPresenterUserDetailProtocol {
    
}
