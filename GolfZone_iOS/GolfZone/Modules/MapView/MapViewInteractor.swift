//
//  MapViewInteractor.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import Foundation

class MapViewInteractor: PresenterToInteractorMapViewProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterMapViewProtocol?
    var address: Address?
}
