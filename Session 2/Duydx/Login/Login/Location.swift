//
//  Location.swift
//  Login
//
//  Created by admin on 8/7/18.
//  Copyright © 2018 admin. All rights reserved.
//
import MapKit
import UIKit

class Location: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init(_ title: String?, _ coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
