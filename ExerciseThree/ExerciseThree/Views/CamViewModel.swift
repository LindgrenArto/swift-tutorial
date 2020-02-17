//
//  CamViewModel.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 10/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI
import Combine
import Foundation
import CoreLocation

final class CamViewModel: ObservableObject {
    @Published var cameraData: CameraModel?
    
    
    init() {
        self.fetch()
    }
}



extension CamViewModel {
    func fetch(_ id: String = "C01503") {
        Api().fetchTrafficCam(by:id) {
            self.cameraData = $0
        }
    }
}

