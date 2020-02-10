//
//  ContentView.swift
//  CameraTutorial
//
//  Created by Arto Lindgren on 07/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var activeTab:Int = 2
    
    var body: some View {
        TabView(selection: $activeTab) {
            Text("Feed").tabItem { Image(systemName: "list.bullet") }.tag(1)
            FriendsView().tabItem { Image(systemName: "person.2.fill") }.tag(2)
            Text("Groups").tabItem { Image(systemName: "person.3.fill") }.tag(3)
            Text("Settings").tabItem { Image(systemName: "gear") }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

