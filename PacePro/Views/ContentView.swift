//
//  ContentView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RacesListView()
                .tabItem {
                    Label("Races", systemImage: "list.dash")
                }
            
            PaceView()
                .tabItem {
                    Label("Pace", systemImage: "stopwatch")
                }
            
            DateCalculatorView()
                .tabItem {
                    Label("Dates", systemImage: "calendar")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
