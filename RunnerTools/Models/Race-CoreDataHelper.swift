//
//  Race-CoreDataHelper.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/25/22.
//

import Foundation

extension Race {
    var raceName: String {
        name ?? "New Race"
    }
    
    var raceDate: Date {
        date ?? Calendar.current.startOfDay(for:Date())
    }
    
    var raceDateString: String? {
        let df = DateFormatter()
        df.dateStyle = .medium
        
        return df.string(from: raceDate)
    }
    
    static var example: Race {
        let controller = DataController.preview
        let context = controller.container.viewContext
        
        let race = Race(context: context)
        race.name = "2022 Dogfish Dash"
        race.date = Date()
        return race
    }
}
