//
//  ImageLoader.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 17/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//


import Foundation

class ImageLoader: ObservableObject {
    
    @Published var data:Data?
    
    init(urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                if let data = data {
                    DispatchQueue.main.async {
                        self.data = data
                    }
                }
            }
        }
    }
}
