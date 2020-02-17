//
//  Data.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 10/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//


import Foundation

struct CameraModel: Codable {
    let dataUpdatedTime: String
    let cameraStations: [CameraStations]
}


struct CameraStations: Codable, Identifiable, Hashable {
    let id: String
    let roadStationId: Int
    let nearestWeatherStationId: Int
    let cameraPresets: [CameraPresets]
}

struct CameraPresets: Codable, Identifiable, Hashable {
    let id: String
    let presentationName: String
    let imageUrl: String
    let measuredTime: String
}

