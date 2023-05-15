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
        var urlString = Constants.getUrlString(of: Constants.requests.coordinate)
        let franceCode = "ISO3166-2"
        urlString = "\(urlString)q=\(city),\(franceCode)&appid=\(Constants.Service.API.apiKey)"
        guard let url = URL(string: urlString) else {
            throw AppError.ServiceError.invalidData
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constants.httpMethod.get
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoder = self.getDecoder()
        return try decoder.decode([CoordinateResponse].self, from: data)
    }
    
    public func getData(lat: Double, lon: Double) async throws -> WeatherResponse? {
        var urlString = Constants.getUrlString(of: Constants.requests.weather)
        urlString = "\(urlString)lat=\(lat)&lon=\(lon)&appid=\(Constants.Service.API.apiKey)"
        guard let url = URL(string: urlString) else {
            throw AppError.ServiceError.invalidData
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constants.httpMethod.get
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoder = self.getDecoder()
        return try decoder.decode(WeatherResponse.self, from: data)
    }
}
