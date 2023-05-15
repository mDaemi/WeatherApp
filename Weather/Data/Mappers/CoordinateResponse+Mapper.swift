//
//  CoordinateResponse+Mapper.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

extension CoordinateResponse {
    func toDomain() -> Coordinate {
        return Coordinate(name: self.name ?? "",
                          lat: self.lat,
                          lon: self.lon)
    }
}
