//
//  Data.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 10/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import Foundation

struct Data: Codable{
    let dataUptadedTime: String
    let cameraStations: [CameraStations]
    
}

struct CameraStations: Codable {
    let id: String
    let roadStationId, nearestWeatherStationId : Int
    let cameraPresets: [CameraPresets]
}


struct CameraPresets: Codable {
    let id: String
    let presentationName, imageUrl, measuredTime: String
}
