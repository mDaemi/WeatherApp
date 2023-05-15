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
                              temp: self.temp?.temp,
                              clouds: self.clouds?.all)
    }
}
