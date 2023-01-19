//
//  RidesTests.swift
//  RidesTests
//
//  Created by Ashfaq Anaz on 2023-01-10.
//
//
//  RidesTests.swift
//  RidesTests
//
//  Created by Ashfaq Anaz on 2023-01-10.
//

import XCTest
@testable import Rides

class RidesTests: XCTestCase {
    
    var viewModel: VehicleViewModel!
        
        override func setUp() {
            super.setUp()
            viewModel = VehicleViewModel()
        }
        // checks if value between 0 to 100 works
        func testFetchVehiclesWithValidCount() {
            viewModel.fetchVehicles(withCount: 50) {
                XCTAssert(self.viewModel.vehicles?.count == 50)
            }
        }
        // checks if any number greater than 100 calls the API
        func testFetchVehiclesWithInvalidCount() {
            let invalidCount = 125
            viewModel.fetchVehicles(withCount: invalidCount) {
                XCTAssert(self.viewModel.vehicles?.count == nil)
            }
        }
    
}
