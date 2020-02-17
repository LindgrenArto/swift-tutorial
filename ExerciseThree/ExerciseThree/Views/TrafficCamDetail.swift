//
//  TrafficCamDetail.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 17/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI


struct TrafficCamDetail: View {
    var camPreset: CameraPresets
    
    var body: some View {
        VStack {
            Text(camPreset.presentationName)
            ImageView(withURL: camPreset.imageUrl)
        }
    }
}

