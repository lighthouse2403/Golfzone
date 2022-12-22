//
//  UserListInteractor.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation

class UserListInteractor: PresenterToInteractorUserListProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterUserListProtocol?
    var entity: InteractorToEntityUserListProtocol?
    var userList: [UserDetail]?

    func getUserList() {
        entity?.getUser(completionHandler: { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let users):
                self.userList = users
                self.presenter?.reloadData(data: users)
            case .failure(let error):
                self.presenter?.showError(error: error)
            }
        })
    }
}
