//
//  CircleImage.swift
//  swift-tutorial
//
//  Created by Arto Lindgren on 10/01/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Image")
        .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
