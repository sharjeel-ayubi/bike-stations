//
//  AnnotationItem.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 30/05/2023.
//

import Foundation
import MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
