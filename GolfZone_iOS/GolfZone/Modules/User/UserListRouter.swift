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
              let window = appDelegate.window else {
            return
        }
        let rootNavigation = UINavigationController.init(rootViewController: destinationVC)
        window.rootViewController = rootNavigation
        window.makeKeyAndVisible()
    }
    
    // MARK: Static methods
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "UserList", bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType:UserListViewController.self)
        
        let presenter: ViewToPresenterUserListProtocol & InteractorToPresenterUserListProtocol = UserListPresenter()
        let entity: InteractorToEntityUserListProtocol = UserListEntity()

        viewController.presenter = presenter
        viewController.presenter?.router = UserListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.entity = entity

        return viewController
    }
    
    func showUserDetail(user: UserDetail) {
        UserDetailRouter().showScreen(user: user)
    }
}
