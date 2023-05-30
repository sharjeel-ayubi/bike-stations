//
//  GetBikeStationListRequest.swift
//  bike-stations
//
//  Created by Sharjeel Ayubi on 29/05/2023.
//

import Foundation

struct GetBikeStationListRequest: DataRequest {

    typealias Response = BikeStationsResponse
    
    var url: String {
        let path = "/mim/plan/map_service.html"
        return Constants.BASE_URL + path
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var queryItems: [String : String] {
        return ["mtype": "pub_transport",
                "co": "stacje_rowerowe"]
    }
    
}
