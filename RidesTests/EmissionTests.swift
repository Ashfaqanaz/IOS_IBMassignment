//
//  EmissionTests.swift
//  RidesTests
//
//  Created by Ashfaq Anaz on 2023-01-19.
//

@testable import Rides

import XCTest

class VehicleDetailsViewControllerTests: XCTestCase {

    var sut: VehicleDetailsViewController!

    override func setUp() {
        super.setUp()
        sut = VehicleDetailsViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
// Tests emissions for 4000km
    func testCalculateEmissions() {
        // Given
        let vehicle = Vehicle(id: 1, uid: "123", vin: "123", make_and_model: "Test car", car_type: "Sedan", color: "White", kilometrage: 4000)
        sut.vehicle = vehicle

        // When
        let emissions = sut.calculateEmissions(kilometrage: Double(vehicle.kilometrage))

        // Then
        XCTAssertEqual(emissions, 4000, "Expected emissions to be 4000 for 4000 km travelled")
    }
// Tests emissions for more than 5000km
    func testCalculateEmissionsWithKilometrageGreaterThan5000() {
        // Given
        let vehicle = Vehicle(id: 1, uid: "123", vin: "123", make_and_model: "Test car", car_type: "Sedan", color: "White", kilometrage: 6000)
        sut.vehicle = vehicle

        // When
        let emissions = sut.calculateEmissions(kilometrage: Double(vehicle.kilometrage))

        // Then
        XCTAssertEqual(emissions, 6500, "Expected emissions to be 6500 for 6000 km travelled")
    }

}

