//
//  WebSiteRouter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import Foundation
import UIKit

class WebSiteRouter: PresenterToRouterWebSiteProtocol {
    func showScreen(url: String) {
        let destinationVC = self.createModule(url: url)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window,
              let rootNavigation = window.rootViewController as? UINavigationController else {
            return
        }
        
        rootNavigation.pushViewController(destinationVC, animated: true)
    }
    
    // MARK: Static methods
    func createModule(url: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "WebSite", bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType:WebSiteViewController.self)
        
        let presenter: ViewToPresenterWebSiteProtocol & InteractorToPresenterWebSiteProtocol = WebSitePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = WebSiteRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = WebSiteInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.url = url

        return viewController
    }
}
