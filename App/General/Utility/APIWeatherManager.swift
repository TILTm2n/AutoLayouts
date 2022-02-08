//
//  APIWeatherManager.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 06.02.2022.
//

import Foundation

struct Coordinates{
    let latitude: Double
    let longtitude: Double
}

enum ForecastType: FinalURLPoint {
    case Current(apiKey: String, coordinates: Coordinates)
    
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/onecall?")!
    }
    
    var path: String {
        switch self {
        case let .Current(apiKey, coordinates):
            return "lat=\(coordinates.latitude)&lon=\(coordinates.longtitude))&appid=\(apiKey)"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)
    }
}

//final class APIWeatherManager: APIManager{
//    let sessionConfiguration: URLSessionConfiguration
//    lazy var session: URLSession = {
//        return URLSession(configuration: self.sessionConfiguration)
//    }()
//
//    let apiKey: String = "5c3cbd6a194ea55903526944cac7ebe1"
//
//    init(sessionConfiguration: URLSessionConfiguration, apiKey: String){
//        self.sessionConfiguration = sessionConfiguration
//        self.apiKey = apiKey
//    }
//
//    //создадим convinience инициализатор, который будем использовать при использовании дефолтной сессии
//    convenience init(apiKey: String) {
//        self.init(sessionConfiguration: URLSessionConfiguration.default, apiKey: apiKey)
//    }
//
//    func fetchCurrentWeatherWith(coordinates: Coordinates, completionHandler: (APIResult<LocationModel>) -> Void) {
//        let request = ForecastType.Current(apiKey: apiKey, coordinates: coordinates).request
//
//
//
//
//    }
//}
