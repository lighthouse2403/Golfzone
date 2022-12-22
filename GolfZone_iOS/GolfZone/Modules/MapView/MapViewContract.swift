//
//  MapViewContract.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewMapViewProtocol {
    func addAnnotation(annotation: AddressAnnotation)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMapViewProtocol {
    var view: PresenterToViewMapViewProtocol? { get set }
    var interactor: PresenterToInteractorMapViewProtocol? { get set }
    var router: PresenterToRouterMapViewProtocol? { get set }
    func pinLocation()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMapViewProtocol {
    var presenter: InteractorToPresenterMapViewProtocol? { get set }
    var address: Address? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMapViewProtocol {
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMapViewProtocol {
}
