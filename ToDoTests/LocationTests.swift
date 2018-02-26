//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Abin Baby on 23/02/2018.
//  Copyright © 2018 Abin Baby. All rights reserved.
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
    
    func test_Init_SetsaCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1,
                                                longitude: 2)
        let location = Location(name: "",
                                coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude,
                       coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude,
                       coordinate.longitude)
    }
    
    func test_Init_SetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        XCTAssertEqual(first, second)
    }
    
    
    func assertLocationNotEqualwith(firstName: String,
                                    firstLongitudeLatitude: (Double, Double)?,
                                    secondName: String,
                                    secondLongitudeLatitude: (Double, Double)?,
                                    line: UInt = #line) {
        var firstCoordinate: CLLocationCoordinate2D? = nil
        if let firstLongitudeLatitude = firstLongitudeLatitude {
            firstCoordinate = CLLocationCoordinate2D(latitude: firstLongitudeLatitude.0,
                                                     longitude: firstLongitudeLatitude.1)
        }
        let firstLocation = Location(name: firstName,
                                     coordinate: firstCoordinate)
        
        var secondCoordinate: CLLocationCoordinate2D? = nil
        if let secondLongitudeLatitude = secondLongitudeLatitude {
            secondCoordinate = CLLocationCoordinate2D(latitude: secondLongitudeLatitude.0,
                                                      longitude: secondLongitudeLatitude.1)
        }
        let secondLocation = Location(name: secondName,
                                      coordinate: secondCoordinate)
        XCTAssertNotEqual(firstLocation,
                          secondLocation,
                          line: line)
    }
    
    func test_Locations_WhenlatitudeDiffers_AreNotEqual() {
        assertLocationNotEqualwith(firstName: "Foo",
                                   firstLongitudeLatitude:(1.0, 0.0),
                                   secondName: "Foo",
                                   secondLongitudeLatitude: (0.0, 0.0))
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        
        
        assertLocationNotEqualwith(firstName: "Foo",
                                   firstLongitudeLatitude: (0.0, 1.0),
                                   secondName: "Foo",
                                   secondLongitudeLatitude: (0.0, 0.0))
    }
    
    func test_Locations_WhenOnlyOneHasCoordinate_AreNotEqual() {
        assertLocationNotEqualwith(firstName: "Foo", firstLongitudeLatitude: (0.0, 0.0), secondName: "Foo", secondLongitudeLatitude: nil)
    }
    
    func test_Locations_WhenNamesDiffer_AreNotEqual() {
        assertLocationNotEqualwith(firstName: "Foo", firstLongitudeLatitude: nil, secondName: "Bar", secondLongitudeLatitude: nil)
    }
}
