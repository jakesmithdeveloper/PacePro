//
//  ContentView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Customize tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        TabView {
            RacesListView()
                .tabItem {
                    Label("Races", systemImage: "figure.run.circle.fill")
                }
            
            PaceView()
                .tabItem {
                    Label("Pace", systemImage: "stopwatch.fill")
                }
            
            DateCalculatorView()
                .tabItem {
                    Label("Dates", systemImage: "calendar.circle.fill")
                }
        }
        .accentColor(AppTheme.primaryAccent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
