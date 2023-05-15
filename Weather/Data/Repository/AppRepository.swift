//
//  AppRepository.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

class AppRepository: PAppRepository {
    // MARK: - Properties
    static let shared = AppRepository()
    private let dataSource: AppDataSource = AppDataSource()
    
    // MARK: - public
    func getCoordinates(for city: String) async throws -> [Coordinate]? {
        return try await dataSource.getCoordinates(for: city)
    }
    
    func getData(lat: Double, lon: Double) async throws -> Weather? {
        return try await dataSource.getData(lat: lat, lon: lon)
    }
}
