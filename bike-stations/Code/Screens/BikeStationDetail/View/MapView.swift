//
//  MapView.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 30/05/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: MapViewVM
    
    var body: some View {
        Map(coordinateRegion: $viewModel.coordinateRegion, showsUserLocation: true, annotationItems: viewModel.annotations) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                HStack {
                    showBikeAnnotation()
                    showTextAnnotation()
                }
            }
        }
        .onAppear {
            viewModel.handleOnAppear()
        }
    }
    
    func showBikeAnnotation() -> some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .opacity(1)
            Image("bike")
                .resizable()
                .frame(width: 17, height: 17)
        }
    }
    
    func showTextAnnotation() -> some View {
        Text(viewModel.station.properties.bikes)
            .font(.system(size: 20, weight: .heavy))
            .bold()
            .foregroundColor(.green)
    }
}
