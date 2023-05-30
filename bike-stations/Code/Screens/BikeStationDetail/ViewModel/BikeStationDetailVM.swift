//
//  BikeStationDetailVM.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import Foundation
import CoreLocation

class BikeStationDetailVM: ObservableObject {
    
    let station: Station
    let location: CLLocation?
    
    init(station: Station, location: CLLocation?) {
        self.station = station
        self.location = location
    }
    
    func getStationLocation() -> CLLocationCoordinate2D {
        guard station.geometry.coordinates.count == 2,
              let lat = station.geometry.coordinates.first,
              let lng = station.geometry.coordinates.last
        else {
            return CLLocationCoordinate2D()
        }
        let stationLocation = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        return stationLocation
    }
}
