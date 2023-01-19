//
//  ViewController.swift
//  Rides
//
//  Created by Ashfaq Anaz on 2023-01-10.
//

import UIKit



class ViewController: UIViewController{

    
    var viewModel = VehicleViewModel()
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var ridesTableView: UITableView!
    @IBOutlet weak var sortOptions: UISegmentedControl!
    
    // On search button pressed this function outputs vehicles in the TableView and by default is sorted by VIN
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        guard let input = searchBar.text, let count = Int(input) else {
            print("Invalid input")
            return
        }
        viewModel.fetchVehicles(withCount: count) { [weak self] in
           DispatchQueue.main.async {
                
                if let vehicles = self?.viewModel.vehicles {
                    self?.vehicles = vehicles
                    self?.vehicles.sort { $0.vin < $1.vin }
                    self?.ridesTableView.reloadData()
                    
                }
               
            }
            
        }
    }
    
    // Sort option allows to toggle between dorting by car_type and VIN
    @IBAction func sortOptionsChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
               vehicles.sort { $0.vin < $1.vin }
        
        } else if sender.selectedSegmentIndex == 1 {
            vehicles.sort { $0.car_type < $1.car_type }
        }
        self.ridesTableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sortOptions.removeAllSegments()
        sortOptions.insertSegment(withTitle: "VIN", at: 0, animated: true)
        sortOptions.insertSegment(withTitle: "Car Type", at: 1, animated: true)
        sortOptions.selectedSegmentIndex = 0
        ridesTableView.delegate = self
        ridesTableView.dataSource = self
        ridesTableView.isScrollEnabled = true
        ridesTableView.bounces = true
        
        
        
    }
    
    //Goes to Screen 2 (vehicle details) when table cell is selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VehicleDetailsSegue" {
            if let vehicleDetailsVC = segue.destination as? VehicleDetailsViewController {
                vehicleDetailsVC.vehicle = sender as? Vehicle
            }
        }
    }


    private var vehicles = [Vehicle]()

    

}

// TableView functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVehicle = vehicles[indexPath.row]
        performSegue(withIdentifier: "VehicleDetailsSegue", sender: selectedVehicle)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.isEmpty ? 0 : vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ridesTableView.dequeueReusableCell(withIdentifier: "rideCell", for: indexPath)
        if !vehicles.isEmpty {
            let vehicle = vehicles[indexPath.row]
            cell.textLabel?.text = vehicle.make_and_model
            cell.detailTextLabel?.text = vehicle.vin
            
        }
        return cell
    }

    
    

}
