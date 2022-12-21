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
    
    func loadData() {
        view?.showLoading()
        interactor?.getUserList()
    }
    
    func showUserDetail(indexPath: IndexPath) {
        guard let userList = interactor?.userList else { return }
        router?.showUserDetail(user: userList[indexPath.row])
    }
}

extension UserListPresenter: InteractorToPresenterUserListProtocol {
    func reloadData(data: [UserDetail]) {
        view?.reloadData(data: data)
        view?.hideLoading()
    }
}
