//
//  Weather.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

struct Weather {
    var name: String
    var temp: Temperature?
    var clouds: Clouds?
}

struct Temperature {
    var temp: Double?
}

struct Clouds {
    var all: Double?
}
