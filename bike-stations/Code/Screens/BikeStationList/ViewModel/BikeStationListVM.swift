//
//  BikeStationListVM.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import Foundation
import CoreLocation
import Combine

class BikeStationListVM: ObservableObject {
    
    @Published var isLoading = false
    @Published var bikeStations: [Station]?
    @Published var error: NetworkError?
    @Published var location: CLLocation?
    
    private let networkService: BikeStationsNetworkServiceProtocol
    private let locationService: LocationService
    private var cancellable = Set<AnyCancellable>()
    
    init(networkService: BikeStationsNetworkServiceProtocol = BikeStationNetworkService(),
         locationService: LocationService = LocationService()) {
        self.networkService = networkService
        self.locationService = locationService
        self.locationService.delegate = self
    }
}

//MARK: Handler Methods
extension BikeStationListVM {
    func handleOnAppear() {
        locationService.requestLocation()
        fetchBikeStations()
    }
}

//MARK: API Response
extension BikeStationListVM {
    func fetchBikeStations() {
        isLoading = true
        networkService.fetchBikeStations()
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                    self.error = error
                case .finished:
                    self.isLoading = false
                }
            } receiveValue: { (response) in
                self.bikeStations = response.features
            }
            .store(in: &cancellable)
    }
}

//MARK: Location delegate
extension BikeStationListVM: LocationServiceDelegate {
    func locationIsSet(location: CLLocation?) {
        self.location = location
    }
}
