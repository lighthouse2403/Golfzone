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
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserListProtocol {
    var view: PresenterToViewUserListProtocol? { get set }
    var interactor: PresenterToInteractorUserListProtocol? { get set }
    var router: PresenterToRouterUserListProtocol? { get set }
    func loadData()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserListProtocol {
    var presenter: InteractorToPresenterUserListProtocol? { get set }
    var entity: InteractorToEntityUserListProtocol? { get set }
    func getUserList()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserListProtocol {
    func reloadData(data: [UserDetail])
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserListProtocol {
}

protocol InteractorToEntityUserListProtocol {
    func getUser(completionHandler: @escaping (Result<[UserDetail], ServiceError>) -> Void)
}
