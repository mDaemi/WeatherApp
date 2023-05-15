//
//  AppDataSource.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

class AppDataSource {
    // MARK: - Properties
    private let service = AppService()

    // MARK: - Public
    public func getCoordinates(for city: String) async throws -> [Coordinate]? {
        let result = try await service.getCoordinates(for: city).map {$0.map {$0.toDomain()}}
        return result
    }
    
    public func getData(lat: Double, lon: Double) async throws -> Weather? {
        return try await service.getData(lat: lat, lon: lon)?.toDomain()
    }
}
