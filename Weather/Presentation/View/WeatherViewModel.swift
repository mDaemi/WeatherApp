//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

protocol PWeatherViewModel: ObservableObject {
    func getData(for city: String) async throws
}

@MainActor
final class WeatherViewModel: PWeatherViewModel {
    // MARK: - Properties
    @Published private(set) var weather: [WeatherUIModel] = []
    private let useCase = DataUseCaseProvider().provideAppUseCase()
    
    // MARK: - Public
    func getData(for city: String) async throws {
        do {
            let coordinate = try await useCase.loadCoordinates(for: city)?.first?.toPresentation()
            if let lat = coordinate?.lat, let lon = coordinate?.lon {
                if let newData = try await useCase.loadData(lat: lat, lon: lon)?.toPresentation() {
                    weather.append(newData)
                }
            }
        } catch {
            throw AppError.ServiceError.error(error: error)
        }
    }
}
