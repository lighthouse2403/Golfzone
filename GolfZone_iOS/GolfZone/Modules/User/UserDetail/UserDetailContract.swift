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
    func setupUserDetail(user: UserDetail)
    func callPhoneNumber(number: String)
    func sendEmail(email: String)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserDetailProtocol {
    var view: PresenterToViewUserDetailProtocol? { get set }
    var interactor: PresenterToInteractorUserDetailProtocol? { get set }
    var router: PresenterToRouterUserDetailProtocol? { get set }
    func viewDidLoad()
    func callPhoneNumber()
    func showWebSite()
    func sendEmail()
    func displayLocation()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserDetailProtocol {
    var presenter: InteractorToPresenterUserDetailProtocol? { get set }
    var user: UserDetail? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserDetailProtocol {
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserDetailProtocol {
    func showWebSite(url: String)
    func displayLocation(address: Address)
}
