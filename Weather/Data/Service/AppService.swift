//
//  AppService.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

final class AppService: AbstractService {
    
    // MARK: - Properties
    static let shared = AppService()

    // MARK: - public
    public func getCoordinates(for city: String) async throws -> [CoordinateResponse]? {
        return nil
    }
    
    public func getData(lat: Double, lon: Double) async throws -> WeatherResponse? {
        return nil
    }
}
