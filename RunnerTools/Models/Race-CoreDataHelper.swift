//
//  Race-CoreDataHelper.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/25/22.
//

import Foundation

extension Race {
    
    // Nil coalescessors
    var raceName: String {
        name ?? "New Race"
    }
    
    var raceDate: Date {
        date ?? Calendar.current.startOfDay(for:Date())
    }
    
    var raceDistance: Double {
        distance
    }
    
    var raceWebsite: String {
        website ?? ""
    }
    
    var raceUnit: String {
        unit ?? "miles"
    }
    
    // Display Strings
    var raceDateString: String? {
        let df = DateFormatter()
        df.dateStyle = .medium
        
        return df.string(from: raceDate)
    }
    
    static var example: Race {
        let controller = DataController.preview
        let context = controller.container.viewContext
        
        let race = Race(context: context)
        race.name = "Dogfish Dash"
        race.date = Calendar.current.date(from: DateComponents(year: 2022, month: 9, day: 25))
        return race
    }
}
