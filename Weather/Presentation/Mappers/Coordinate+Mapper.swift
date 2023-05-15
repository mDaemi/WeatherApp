//
//  Coordinate+Mapper.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

extension Coordinate {
    func toPresentation() -> CoordinateUIModel {
        return CoordinateUIModel(name: self.name,
                                 lat: self.lat,
                                 lon: self.lon)
    }
}
