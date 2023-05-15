//
//  WeatherResponse+Mapper.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

extension WeatherResponse {
    func toDomain() -> Weather {
        return Weather(name: self.name ?? "",
                       temp: self.main?.toDomain(),
                       clouds: self.clouds?.toDomain())
    }
}

extension TemperatureResponse {
    func toDomain() -> Temperature {
        return Temperature(temp: self.temp)
    }
}

extension CloudsResponse {
    func toDomain() -> Clouds {
        return Clouds(all: self.all)
    }
}
