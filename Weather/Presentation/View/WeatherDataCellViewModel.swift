//
//  WeatherDataCellViewModel.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

protocol PWeatherDataCellViewModel: ObservableObject {
}

final class WeatherDataCellViewModel: PWeatherDataCellViewModel {
    // MARK: - Properties
    @Published private(set) var cityName: String
    @Published private(set) var temp: String?
    @Published private(set) var clouds: Double?
    
    // MARK: - init
    init(cityName: String, temp: String?, clouds: Double?) {
        self.cityName = cityName
        self.temp = temp
        self.clouds = clouds
    }
}
