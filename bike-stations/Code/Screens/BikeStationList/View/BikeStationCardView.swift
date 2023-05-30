//
//  BikeStationCardView.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import SwiftUI
import CoreLocation

struct BikeStationCardView: View {
    
    var viewModel: BikeStationCardVM
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            headerView()
            subHeadingView()
            Spacer().frame(height: 10)
            bottomView()
        }
    }
    
    func headerView() -> some View {
        HStack {
            Text(viewModel.station.id)
                .font(.system(size: 25))
                .bold()
            Text(viewModel.station.properties.label)
                .font(.system(size: 25))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .bold()
            Spacer()
        }
    }
    
    func subHeadingView() -> some View {
        HStack {
            Text("\(viewModel.getDistance())m")
                .font(.system(size: 13))
            Text("•")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.gray)
            Text("Bike Station")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.gray)
        }
    }
    
    func infoBlock(imageStr: String, title: String, number: String, numberColor: Color) -> some View {
        VStack(alignment: .center, spacing: 5.0) {
            Image(imageStr)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.gray)
            Text(number)
                .font(.system(size: 60, weight: .heavy))
                .bold()
                .foregroundColor(numberColor)
        }
    }
    
    func bottomView() -> some View {
        HStack {
            Spacer()
            infoBlock(imageStr: "bike", title: "Available Bikes", number: viewModel.station.properties.bikes, numberColor: .green)
            Spacer()
            infoBlock(imageStr: "lock", title: "Available Places", number: viewModel.station.properties.freeRacks, numberColor: .black)
            Spacer()
        }
    }
}

struct BikeStationCardView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationCardView(viewModel: BikeStationCardVM(item: Station(id: "047",
                                          geometry: Geometry(coordinates: [16.909132,52.430317], type: "Point"),
                                          type: "Feature",
                                          properties: Properties(freeRacks: "10",
                                                                 bikes: "0",
                                                                 label: "Ofiar Dabia",
                                                                 bikeRacks: "15",
                                                                 updated: "2022-12-01 00:08")), location: CLLocation(latitude: 0.0, longitude: 0.1)))
    }
}
