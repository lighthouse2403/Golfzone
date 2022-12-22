//
//  AddressAnnotation.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//

import Foundation
import MapKit

class AddressAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String?

    init(title: String?, info: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
