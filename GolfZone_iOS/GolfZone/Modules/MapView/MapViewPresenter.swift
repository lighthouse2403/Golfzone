//
//  MapViewPresenter.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import Foundation
import MapKit

class MapViewPresenter: ViewToPresenterMapViewProtocol {
    // MARK: Properties
    var view: PresenterToViewMapViewProtocol?
    var interactor: PresenterToInteractorMapViewProtocol?
    var router: PresenterToRouterMapViewProtocol?
    
    func pinLocation() {
        guard let address = interactor?.address,
              let lat = address.geo?.lat,
              let lng = address.geo?.lng,
              let latitude = Double(lat),
              let longitude = Double(lng) else { return }
        
        let coordinate = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        let annotation = AddressAnnotation.init(title: address.street, info: address.suite, coordinate: coordinate)
        view?.addAnnotation(annotation: annotation)
    }
}

extension MapViewPresenter: InteractorToPresenterMapViewProtocol {
    
}
