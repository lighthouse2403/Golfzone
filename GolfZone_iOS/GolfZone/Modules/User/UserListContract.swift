//
//  UserListContract.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewUserListProtocol: BaseViewProtocol {
    func reloadData(data: [UserDetail])
    func showError(error: ServiceError)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserListProtocol {
    var view: PresenterToViewUserListProtocol? { get set }
    var interactor: PresenterToInteractorUserListProtocol? { get set }
    var router: PresenterToRouterUserListProtocol? { get set }
    func loadData()
    func showUserDetail(indexPath: IndexPath)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserListProtocol {
    var presenter: InteractorToPresenterUserListProtocol? { get set }
    var entity: InteractorToEntityUserListProtocol? { get set }
    var userList: [UserDetail]? { get set }
    func getUserList()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserListProtocol {
    func reloadData(data: [UserDetail])
    func showError(error: ServiceError)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserListProtocol {
    func showUserDetail(user: UserDetail)
}

protocol InteractorToEntityUserListProtocol {
    func getUser(completionHandler: @escaping (Result<[UserDetail], ServiceError>) -> Void)
}
