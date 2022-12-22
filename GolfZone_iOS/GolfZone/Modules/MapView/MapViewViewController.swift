//
//  MapViewViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import UIKit
import MapKit

class MapViewViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    // MARK: - Properties
    var presenter: ViewToPresenterMapViewProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.pinLocation()
    }    
}

extension MapViewViewController: PresenterToViewMapViewProtocol{
    func addAnnotation(annotation: AddressAnnotation) {
        mapView.addAnnotation(annotation)
    }
}
