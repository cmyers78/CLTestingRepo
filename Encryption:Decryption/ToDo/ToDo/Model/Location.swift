//
//  Location.swift
//  ToDo
//
//  Created by Christopher Myers on 4/17/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}
