//
//  BikeStationsNetworkService.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import Foundation
import Combine

protocol BikeStationsNetworkServiceProtocol {
    func fetchBikeStations() -> AnyPublisher<BikeStationsResponse, NetworkError>
}

final class BikeStationNetworkService: BikeStationsNetworkServiceProtocol {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService = DefaultNetworkService()) {
        self.networkService = networkService
    }
    
    func fetchBikeStations() -> AnyPublisher<BikeStationsResponse, NetworkError> {
        let request = GetBikeStationListRequest()
        return networkService.request(request)
    }
}
