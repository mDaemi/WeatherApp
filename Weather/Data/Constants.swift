//
//  Constants.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

struct Constants {
    public typealias APIs = Constants.Service.API
    public typealias requests = Constants.Service.API.request
    public typealias httpMethod = Constants.Service.HttpMethod
    
    struct Service {
        struct API {
            static let base = "api.openweathermap.org"
            static let coordinate = "/geo/1.0/direct?"
            static let weather = "/data/2.5/weather?"
            static let apiKey = "c1cf851d1775bcb68bd0a1cf2f5185da"
            
            enum request {
                case coordinate
                case weather
            }
        }
        
        struct HttpMethod {
            static let get = "GET"
            static let put = "PUT"
            static let post = "POST"
            static let delete = "DELETE"
        }
    }
}

extension Constants {
    static func getUrlString(of request: requests) -> String {
        var suffix: String = ""
        
        switch request {
        case .coordinate:
            suffix = APIs.coordinate
        case .weather:
            suffix = APIs.weather
        }
        
        return "https://\(APIs.base)\(suffix)"
    }
}
