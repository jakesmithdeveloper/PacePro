//
//  RaceEdit-ViewModel.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/26/22.
//

import CoreData
import Foundation
import Combine


class RaceEditViewModel: ObservableObject {

    let race: Race
    
    @Published var name: String
    @Published var date: Date
    @Published var website: String
    @Published var logoBackgroundColor: String
    @Published var logoTextColor: String
    @Published var logoSfSymbol: String
    @Published var requests = Set<AnyCancellable>()
    
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
        _logoBackgroundColor = Published(wrappedValue: race.racelogoBackgroundColor)
        _logoTextColor = Published(wrappedValue: race.raceLogoTextColor)
        _logoSfSymbol = Published(wrappedValue: race.raceLogoSfSymbol)
    }
    
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: RunLoop.main)
            .sink(receiveValue: completion)
            .store(in: &requests)
    }
    
    func update() {
        race.objectWillChange.send()
        race.name = name
        race.date = date
        race.website = website
        race.edit = false
        race.logoBackgroundColor = logoBackgroundColor
        race.logoTextColor = logoTextColor
        race.logoSfSymbol = logoSfSymbol
    }
}

