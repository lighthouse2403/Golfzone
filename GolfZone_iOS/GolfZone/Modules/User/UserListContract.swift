//
//  UserListContract.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewUserListProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserListProtocol {
    var view: PresenterToViewUserListProtocol? { get set }
    var interactor: PresenterToInteractorUserListProtocol? { get set }
    var router: PresenterToRouterUserListProtocol? { get set }
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserListProtocol {
    var presenter: InteractorToPresenterUserListProtocol? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserListProtocol {
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserListProtocol {
}
