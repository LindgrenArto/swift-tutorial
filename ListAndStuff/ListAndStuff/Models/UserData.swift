//
//  UserData.swift
//  ListAndStuff
//
//  Created by Arto Lindgren on 20/01/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
