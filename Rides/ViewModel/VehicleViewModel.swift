//
//  VehicleViewModel.swift
//  Rides
//
//  Created by Ashfaq Anaz on 2023-01-14.
//

import Foundation

class VehicleViewModel {
    var vehicles:
    [Vehicle]?
    
    //This function allows to fetch vehicles data from API
    func fetchVehicles(withCount count: Int, completion:@escaping() -> ()) {
        
        
        let urlString = "https://random-data-api.com/api/vehicle/random_vehicle?size=\(count)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Failed to fetch data:", error)
                return
            }
            
            guard let data = data else { return }
            do {
                print(data)
                let vehicles = try JSONDecoder().decode([Vehicle].self, from: data)
                self.vehicles = vehicles
                print(vehicles)
                completion()
            } catch {
                print("Failed to decode data:", error)
            }
        }.resume()
    }
}
