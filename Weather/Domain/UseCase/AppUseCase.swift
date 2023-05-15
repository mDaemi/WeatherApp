//
//  AppUseCase.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

protocol PAppUseCase {
    func loadCoordinates(for city: String) async throws -> [Coordinate]?
    func loadData(lat: Double, lon: Double) async throws -> Weather?
}

class AppUseCase: PAppUseCase {
    // MARK: - properties
    let repository: PAppRepository
    
    // MARK: - init
    init(repository: PAppRepository) {
        self.repository = repository
    }
    
    // MARK: - Internals
    func loadCoordinates(for city: String) async throws -> [Coordinate]? {
        return try await self.repository.getCoordinates(for: city)
    }
    
    func loadData(lat: Double, lon: Double) async throws -> Weather? {
        return try await self.repository.getData(lat: lat, lon: lon)
    }
}
