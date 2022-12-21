//
//  UserDetailContract.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewUserDetailProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserDetailProtocol {
    var view: PresenterToViewUserDetailProtocol? { get set }
    var interactor: PresenterToInteractorUserDetailProtocol? { get set }
    var router: PresenterToRouterUserDetailProtocol? { get set }
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserDetailProtocol {
    var presenter: InteractorToPresenterUserDetailProtocol? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserDetailProtocol {
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserDetailProtocol {
}
