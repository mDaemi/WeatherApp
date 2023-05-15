//
//  WeatherResponse.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

struct WeatherResponse: Decodable {
    var name: String?
    var main: TemperatureResponse?
    var clouds: CloudsResponse?
}

struct TemperatureResponse: Decodable {
    var temp: Double?
}

struct CloudsResponse: Decodable {
    var all: Double?
}
