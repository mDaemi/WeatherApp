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
                              // It is better to avoid force unwrap ! 
                              convertTemperature(temp: self.temp!.temp!,
                                                 from: .kelvin,
                                                 to: .celsius) : nil,
                              clouds: self.clouds?.all)
    }
    
    private func convertTemperature(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
        let input = Measurement(value: temp, unit: inputTempType)
        let output = input.converted(to: outputTempType)
        return "\(String(format: "%.1f", output.value)) °C"
    }
}
