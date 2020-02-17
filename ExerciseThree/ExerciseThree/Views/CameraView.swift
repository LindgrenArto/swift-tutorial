//
//  CameraView.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 17/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    var camera: CameraModel?
    var height: CGFloat = 0
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    if (camera?.cameraStations[0].cameraPresets != nil) {
                        ForEach((camera?.cameraStations[0].cameraPresets)!) { cameraPreset in
                            NavigationLink(destination: TrafficCamDetail(camPreset: cameraPreset)) {
                                Text(cameraPreset.presentationName)
                            }
                        }
                    }
                }.navigationBarTitle(Text("Kelikamerat"))
            }
        }
    }
    
    
    struct CameraView_Previews: PreviewProvider {
        static var previews: some View {
            CameraView()
        }
    }
}

