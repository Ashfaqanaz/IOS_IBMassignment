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
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let vehicle = vehicle {
            vinLabel.text = vehicle.vin
            makeAndModelLabel.text = vehicle.make_and_model
            colorLabel.text = vehicle.color 
            carTypeLabel.text = vehicle.car_type
            
            let emissions = calculateEmissions(kilometrage: Double(vehicle.kilometrage))
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.height))
            label.text = "Emissions: "+"\(emissions) "+"units"
                label.textAlignment = .center
                collectionView.addSubview(label)
        }
    }
    
    func calculateEmissions(kilometrage: Double) -> Double {
        var emissions: Double = 0
        if kilometrage <= 5000 {
            emissions = kilometrage * 1
        } else {
            emissions = (5000 * 1) + ((kilometrage - 5000) * 1.5)
        }
        return emissions
    }
}

