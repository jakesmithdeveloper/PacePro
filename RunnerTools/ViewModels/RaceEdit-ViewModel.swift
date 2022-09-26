//
//  RaceEdit-ViewModel.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/26/22.
//

import CoreData
import Foundation

extension RaceEditView {
    class ViewModel: ObservableObject {

        let race: Race
        
        @Published var name: String
        @Published var date: Date
        @Published var website: String
        
        var raceYearString: String {
            guard let yearInt = Calendar.current.dateComponents([.year], from: date).year else { return "" }
            
            return String(yearInt)
        }
        
        var countdownString: String {
            let diffComponents = Calendar.current.dateComponents([.weekOfYear, .day, .hour], from: Calendar.current.startOfDay(for: Date()), to: Calendar.current.startOfDay(for: date))
            let dr = DateResult(weeks: diffComponents.weekOfYear, days: diffComponents.day, hours: diffComponents.hour)
            return dr.dateResultString
        }
        
        init(race: Race) {
            self.race = race
            
            _name = Published(wrappedValue: race.raceName)
            _date = Published(wrappedValue: race.raceDate)
            _website = Published(wrappedValue: race.raceWebsite)
        }
        
        func update() {
            race.objectWillChange.send()
            
            race.name = name
            race.date = date
            race.website = website
        }
    }
}
