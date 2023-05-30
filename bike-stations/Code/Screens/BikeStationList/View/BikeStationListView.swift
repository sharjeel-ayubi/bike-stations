//
//  BikeStationListView.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import SwiftUI

struct BikeStationListView: View {
    @ObservedObject var viewModel = BikeStationListVM()
    var body: some View {
        NavigationView {
            Group {
                if let stations = viewModel.bikeStations {
                    List(stations) { item in
                        BikeStationCardView(viewModel: BikeStationCardVM(item: item, location: viewModel.location))
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 10)
                                    .background(.clear)
                                    .foregroundColor(.white)
                                    .padding(
                                        EdgeInsets(
                                            top: 0,
                                            leading: 0,
                                            bottom: 10,
                                            trailing: 0
                                        )
                                    )
                            )
                            .listRowSeparator(.hidden)
                            .background(
                                NavigationLink("", destination: BikeStationDetailView(viewModel: BikeStationDetailVM(station: item, location: viewModel.location)))
                                    .opacity(0))
                    }
                    .navigationBarTitle("Bike Stations", displayMode: .inline)
                    .refreshable {
                        viewModel.fetchBikeStations()
                    }
                }
            }
        }
        .onAppear(){
            viewModel.handleOnAppear()
        }
    }
}

struct BikeStationListView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationListView()
    }
}
