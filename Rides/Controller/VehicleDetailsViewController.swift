//
//  VehicleDetailsViewController.swift
//  Rides
//
//  Created by Ashfaq Anaz on 2023-01-18.
//

// Displays Vehicle details on screen 2
import Foundation
import UIKit

class VehicleDetailsViewController: UIViewController {
    var vehicle: Vehicle?
    
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var vinLabel: UILabel!
    
    @IBOutlet weak var carTypeLabel: UILabel!
    @IBOutlet weak var makeAndModelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let vehicle = vehicle {
            vinLabel.text = vehicle.vin
            makeAndModelLabel.text = vehicle.make_and_model
            colorLabel.text = vehicle.color 
            carTypeLabel.text = vehicle.car_type
        }
    }
}

