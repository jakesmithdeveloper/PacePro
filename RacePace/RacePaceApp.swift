//
//  RunnerToolsApp.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/19/22.
//

import SwiftUI

@main
struct RacePaceApp: App {
    
    @StateObject var dataController: DataController
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
}
