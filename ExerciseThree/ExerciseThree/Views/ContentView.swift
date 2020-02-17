//
//  ContentView.swift
//  ExerciseThree
//
//  Created by Arto Lindgren on 10/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var cam = CamViewModel()
    @State var id: String = ""
    
    init() {
        Api().fetchTrafficCam(by: "C01503") {
            print($0)
        }
    }
    
    var body: some View {
        VStack{
        
            TextField("Hae kameraa Id:llä", text: $id){
                self.cam.fetch(self.id)
            }
            CameraView(camera: self.cam.cameraData)
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

