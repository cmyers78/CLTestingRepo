//
//  LocationTests.swift
//  ToDo
//
//  Created by Christopher Myers on 4/17/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_Init_WhenGivenCoordinate_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        
        let location = Location(name: "", coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }

    func test_Init_WhenGivenName_SetsName() {
        let location = Location(name: "Foo")
        
        XCTAssertEqual(location.name, "Foo")
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        
        XCTAssertEqual(first, second)
    }
    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        let firstCoord = CLLocationCoordinate2D(latitude: 1.0, longitude: 0.0)
        let first = Location(name: "Foo", coordinate: firstCoord)
        
        let secondCoord = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        let second = Location(name: "Foo", coordinate: secondCoord)
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        let firstCoord = CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0)
        let firstLocation = Location(name: "Foo", coordinate: firstCoord)
        
        let secondCoord = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        let secondLocation = Location(name: "Foo", coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
}
