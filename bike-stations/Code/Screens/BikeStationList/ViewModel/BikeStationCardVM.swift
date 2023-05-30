//
//  BikeStationCardVM.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import Foundation
import CoreLocation

class BikeStationCardVM: ObservableObject {
    
    let station: Station
    private var location: CLLocation?
    
    init(item: Station, location: CLLocation?) {
        self.station = item
        self.location = location
    }
    
    func getDistance() -> String {
        guard station.geometry.coordinates.count == 2,
                let lat = station.geometry.coordinates.first,
                let lng = station.geometry.coordinates.last,
              let currentLocation = self.location else { return "0" }
        let stationLoc = CLLocation(latitude: lat, longitude: lng)
        let distance = Int(currentLocation.distance(from: stationLoc))
        return String(distance)
    }
}
