//
//  BikeStationDetailView.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import SwiftUI
import MapKit

struct BikeStationDetailView: View {
    let viewModel: BikeStationDetailVM
    var body: some View {
        NavigationView {
            VStack {
                let mapViewModel = MapViewVM(coordinate: viewModel.getStationLocation(), station: viewModel.station)
                let bikeStationCardVM = BikeStationCardVM(item: viewModel.station, location: viewModel.location)
                MapView(viewModel: mapViewModel)
                BikeStationCardView(viewModel: bikeStationCardVM)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
    }
}

struct BikeStationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationDetailView(viewModel: BikeStationDetailVM(station: Station(id: "047",
                                                                              geometry: Geometry(
                                                                                coordinates: [16.909132,52.430317],
                                                                                type: "Point"),
                                                                              type: "Feature",
                                                                              properties: Properties(
                                                                                freeRacks: "10",
                                                                                bikes: "0",
                                                                                label: "Ofiar Dabia",
                                                                                bikeRacks: "15",
                                                                                updated: "2022-12-01 00:08")), location: nil))
    }
}
