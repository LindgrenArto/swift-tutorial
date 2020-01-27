//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Arto Lindgren on 20/01/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View {
    
    var weather: Weather?
    @ObservedObject var current = CurrentWeatherViewModel()
    var height: CGFloat = 0
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today")
                .fontWeight(Font.Weight.heavy)
                .font(.title)
                .bold()
            HStack{
                Text("\(weather?.main.temp.round ?? 0) °C")
                    .fontWeight(Font.Weight.thin)
                    .font(.system(size: 65))
                Text("... \(weather?.main.tempMin.round ?? 0) °C")
                    .fontWeight(Font.Weight.thin)
                    .font(.system(size: 65))
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
            
        }.frame(width: height, height: height)
            .background(BackgroundImage())
    }
}



