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
    
    func callPhoneNumber() {
        guard let phone = interactor?.user?.phone else {
            return
        }
        view?.callPhoneNumber(number: phone)
    }
    
    func showWebSite() {
        guard let url = interactor?.user?.website else {
            return
        }
        router?.showWebSite(url: url)
    }
    
    func sendEmail() {
        guard let email = interactor?.user?.email else {
            return
        }
        view?.sendEmail(email: email)
    }
    
    func displayLocation() {
        guard let address = interactor?.user?.address else {
            return
        }
        router?.displayLocation(address: address)
    }
}

extension UserDetailPresenter: InteractorToPresenterUserDetailProtocol {
    
}
