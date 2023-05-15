//
//  CoordinateResponse.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

struct CoordinateResponse: Decodable {
    var name: String?
    var lat: Double?
    var lon: Double?
}
