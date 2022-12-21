//
//  WebSiteContract.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewWebSiteProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterWebSiteProtocol {
    var view: PresenterToViewWebSiteProtocol? { get set }
    var interactor: PresenterToInteractorWebSiteProtocol? { get set }
    var router: PresenterToRouterWebSiteProtocol? { get set }
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorWebSiteProtocol {
    var presenter: InteractorToPresenterWebSiteProtocol? { get set }
    var url: String? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterWebSiteProtocol {
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterWebSiteProtocol {
}
