//
//  MapViewRouter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import Foundation
import UIKit

class MapViewRouter: PresenterToRouterMapViewProtocol {
    func showScreen(address: Address) {
        let destinationVC = self.createModule(address: address)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window,
              let rootNavigation = window.rootViewController as? UINavigationController else {
            return
        }
        
        rootNavigation.pushViewController(destinationVC, animated: true)
    }
    
    // MARK: Static methods
    func createModule(address: Address) -> UIViewController {
        let storyboard = UIStoryboard(name: "MapView", bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType:MapViewViewController.self)
        
        let presenter: ViewToPresenterMapViewProtocol & InteractorToPresenterMapViewProtocol = MapViewPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MapViewRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MapViewInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.address = address

        return viewController
    }
}
