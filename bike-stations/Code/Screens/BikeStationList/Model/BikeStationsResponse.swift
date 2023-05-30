//
//  BikeStationsResponse.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import Foundation

struct BikeStationsResponse: Codable {
    let features: [Station]
}

struct Station: Codable, Identifiable {
    let id: String
    let geometry: Geometry
    let type: String
    let properties: Properties
}

struct Geometry: Codable {
    let coordinates: [Double]
    let type: String
}

struct Properties: Codable {
    let freeRacks: String
    let bikes: String
    let label: String
    let bikeRacks: String
    let updated: String

    enum CodingKeys: String, CodingKey {
        case freeRacks = "free_racks"
        case bikes
        case label
        case bikeRacks = "bike_racks"
        case updated
    }
}
