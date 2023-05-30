//
//  MapViewVM.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 30/05/2023.
//

import Foundation
import MapKit

class MapViewVM: ObservableObject {
    
    @Published var coordinateRegion: MKCoordinateRegion
    @Published var annotations = [AnnotationItem]()
    let coordinate: CLLocationCoordinate2D
    let station: Station
    
    init(coordinate: CLLocationCoordinate2D, station: Station) {
        self.coordinate = coordinate
        self.station = station
        coordinateRegion = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    func handleOnAppear() {
        createAnnotationItem()
    }
    
    private func createAnnotationItem() {
        let annotation = AnnotationItem(coordinate: coordinate)
        annotations.append(annotation)
    }
}
