//
//  BackgroundImage.swift
//  WeatherApp
//
//  Created by Arto Lindgren on 17/01/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct BackgroundImage: View {
    
    
    var body: some View {
        ZStack{
        Image("light_background")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
    }
}
