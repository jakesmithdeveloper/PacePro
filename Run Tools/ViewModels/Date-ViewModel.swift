//
//  Date-ViewModel.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/29/22.
//

import Foundation

class DateCalculatorViewModel: ObservableObject {
    
    @Published var startDate = Date()
    @Published var raceDate = Date()
    @Published var trainingBlockLength = ""
    
    var trainingBlockResult: DateResult {
        computeTrainingBlockLength(start: startDate, end: raceDate)
    }
    
    var startDateResult: String {
        guard let weeks = Int(trainingBlockLength) else {  return "" }
        guard let date = computeStartDate(raceDate: raceDate, trainingLength: weeks) else { return "" }
        return dateToString(date)
    }
    
    var raceDateResult: String {
        guard let weeks = Int(trainingBlockLength) else {  return "" }
        guard let date = computeRaceDate(startDate: startDate, trainingLength: weeks) else { return "" }
        
        return dateToString(date)
    }
    
    func computeTrainingBlockLength(start: Date, end: Date) -> DateResult {
        let diffComponents = Calendar.current.dateComponents([.weekOfYear, .day, .hour], from: Calendar.current.startOfDay(for: start), to: Calendar.current.startOfDay(for: end))
        
        return DateResult(weeks: diffComponents.weekOfYear, days: diffComponents.day, hours: diffComponents.hour)
    }
    
    func computeStartDate(raceDate: Date, trainingLength: Int) -> Date? {
        return Calendar.current.date(byAdding: .weekOfYear, value: -trainingLength, to: raceDate)
    }
    
    func computeRaceDate(startDate: Date, trainingLength: Int) -> Date? {
        return Calendar.current.date(byAdding: .weekOfYear, value: trainingLength, to: startDate)
    }
    
    func dateToString(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateStyle = .full
        return df.string(from: date)
    }
    
}
