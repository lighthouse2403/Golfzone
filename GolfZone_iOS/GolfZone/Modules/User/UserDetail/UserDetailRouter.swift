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
    func showScreen() {
        let destinationVC = self.createModule()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window,
              let rootNavigation = window.rootViewController as? UINavigationController else {
            return
        }
        
        rootNavigation.pushViewController(destinationVC, animated: true)
    }
    
    func setupRootView() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appdelegate.window else { return }
        
        let destinationVC = self.createModule()
        window.rootViewController = UINavigationController.init(rootViewController: destinationVC)
        window.makeKeyAndVisible()
    }
    
    // MARK: Static methods
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "UserDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType:UserDetailViewController.self)
        
        let presenter: ViewToPresenterUserDetailProtocol & InteractorToPresenterUserDetailProtocol = UserDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UserDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserDetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
