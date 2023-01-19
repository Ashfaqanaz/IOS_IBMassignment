//
//  VehicleStructure.swift
//  Rides
//
//  Created by Ashfaq Anaz on 2023-01-17.
//

import Foundation

// Vehicle Struct
struct Vehicle: Codable {
    let id: Int
    let uid: String
    let vin: String
    let make_and_model: String
    let car_type: String
    let color: String
}
