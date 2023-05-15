//
//  AbstractService.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

class AbstractService {
    // MARK: - Properties
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()

    // MARK: - Internal
    func getDecoder() -> JSONDecoder {
        return decoder
    }
}
