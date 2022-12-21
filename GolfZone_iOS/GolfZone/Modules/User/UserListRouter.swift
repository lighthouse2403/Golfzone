//
//  UserListRouter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import Foundation
import UIKit

class UserListRouter: PresenterToRouterUserListProtocol {
    func showScreen() {
        let destinationVC = self.createModule()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window,
              let rootController = window.rootViewController else {
            return
        }
        rootController.present(destinationVC, animated: true)
    }
    
    // MARK: Static methods
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "UserList", bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType:UserListViewController.self)
        
        let presenter: ViewToPresenterUserListProtocol & InteractorToPresenterUserListProtocol = UserListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UserListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
