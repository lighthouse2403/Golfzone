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
    let locationManager =  CLLocationManager()
    let currentPin = MKPointAnnotation()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.pinLocation()
    }
    
    override func setupUI() {
        addTitle(title: presenter?.getMapViewTitle() ?? "")
        setupMapView()
    }
    
    func setupMapView() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 8.0, *) {
            locationManager.requestAlwaysAuthorization()
        } else {
            // Fallback on earlier versions
        }
        locationManager.startUpdatingLocation()
    }
}

extension MapViewViewController: PresenterToViewMapViewProtocol{
    func addAnnotation(annotation: AddressAnnotation) {
        let region = MKCoordinateRegion(center: annotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        //set region on the map
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
}

extension MapViewViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapView.removeAnnotation(currentPin)
        presenter?.pinLocation()
    }
}
