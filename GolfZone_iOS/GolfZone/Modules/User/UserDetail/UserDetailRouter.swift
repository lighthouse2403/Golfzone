//
//  UserDetailRouter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation
import UIKit

class UserDetailRouter: PresenterToRouterUserDetailProtocol {
    func showScreen(user: UserDetail) {
        let destinationVC = self.createModule(user: user)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window,
              let rootNavigation = window.rootViewController as? UINavigationController else {
            return
        }
        
        rootNavigation.pushViewController(destinationVC, animated: true)
    }
    
    // MARK: Static methods
    func createModule(user: UserDetail) -> UIViewController {
        let storyboard = UIStoryboard(name: "UserDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType:UserDetailViewController.self)
        
        let presenter: ViewToPresenterUserDetailProtocol & InteractorToPresenterUserDetailProtocol = UserDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UserDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserDetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.user = user

        return viewController
    }
}
