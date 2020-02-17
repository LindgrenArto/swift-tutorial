//
//  Api.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 10/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//



import SwiftUI
import SwiftyJSON

private let decoder = JSONDecoder()

class Api {
     func fetchTrafficCam(by id: String, completion: @escaping (CameraModel) -> Void) {
        
        guard let url = URL(string: "https://tie.digitraffic.fi/api/v1/data/camera-data/\(id)") else {
            fatalError()
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                print("error")
                return
            }
            do {
               
                let cams = try decoder.decode(CameraModel.self, from: data)
                DispatchQueue.main.async {
                    completion(cams)
                
                }
            }
            catch {
                print(error, "SFA")
            }
        }
        task.resume()
    }
    
}


