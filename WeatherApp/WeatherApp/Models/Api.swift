//
//  Api.swift
//  WeatherApp
//
//  Created by Arto Lindgren on 20/01/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

private let baseUrlForCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let appid = "90502592b0a811b724a6a8c641e831a5"
private let baseUrlForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!

private var decoder: JSONDecoder{
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

import SwiftUI

class API {
    
    class func fetchCurrentWeather(by city: String, onSuccess:  @escaping (Weather) -> Void){
        let query = ["q": "\(city)", "appid": appid, "units": "Metric"]
      
        guard let url = baseUrlForCurrentWeather.withQueries(query)  else {
        
            fatalError()
        }
          print(url)
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            fatalError()
        }
        component.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value)}
        return component.url
    }
}
