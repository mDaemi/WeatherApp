//
//  PAppRepository.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

protocol PAppRepository {
    func getCoordinates(for city: String) async throws -> [Coordinate]?
    func getData(lat: Double, lon: Double) async throws -> Weather?
}
