//
//  Weather+Mapper.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

extension Weather {
    func toPresentation() -> WeatherUIModel {
        return WeatherUIModel(cityName: self.name,
                              temp: (self.temp?.temp != nil) ?
                              String(format: "%.2f", self.temp!.temp!) : nil,
                              clouds: self.clouds?.all)
    }
}
