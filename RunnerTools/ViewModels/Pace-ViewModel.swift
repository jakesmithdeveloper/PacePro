//
//  Pace-ViewModel.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import Foundation

class PaceViewModel: ObservableObject {
    
    let units = ["mile", "kilometer"]
    
    @Published var inputUnit = "mile"
    @Published var outputUnit = "mile"
    @Published var distanceInput = ""
    @Published var totalTimeInput = ""
    
    @Published var hoursIput = ""
    @Published var minutesInput = ""
    @Published var secondsIput = ""
    
    var hours: Int {
        Int(hoursIput) ?? 0
    }
    
    var minutes: Int {
        Int(minutesInput) ?? 0
    }
    
    var seconds: Int {
        Int(secondsIput) ?? 0
    }
    
    var distance: Double {
        Double(distanceInput) ?? 0
    }
    
    var result: String {
        let totalTime = timeFormatToSeconds(hours: hours, minutes: minutes, seconds: seconds)
        let paceSeconds = totalTimeToPace(seconds: totalTime, distance: (inputUnit == outputUnit ? distance : getConversionDistance()))
        let pace = secondsToPace(paceSeconds)
        return pace.paceString
    }
    
    var goalTimeResult: String {
        let totalTime = timeFormatToSeconds(hours: hours, minutes: minutes, seconds: seconds)
        let paceSeconds = getTotalTime(seconds: totalTime, distance: (inputUnit == outputUnit ? distance : getConversionDistance()))
        let pace = secondsToPace(paceSeconds)
        return pace.paceString
    }
    
    
    func milesToKilometers(_ miles: Double) -> Double {
        return miles * 1.60934
    }
            
    func kilometersToMiles(_ kms: Double) -> Double {
        return kms / 1.60934
    }
    
    func timeFormatToSeconds(hours: Int, minutes: Int, seconds: Int) -> Int {
        return (hours * 3600) + (minutes * 60) + seconds
    }
    
    func totalTimeToPace(seconds: Int, distance: Double) -> Int {
        guard distance > 0 else { return 0 }
        return Int(round(Double(seconds) / distance))
    }
    
    func getTotalTime(seconds: Int, distance: Double) -> Int {
        guard distance > 0 else { return 0 }
        return Int(round(Double(seconds) * distance))
    }
    
    func secondsToPace(_ time: Int) -> Pace {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        let pace = Pace(hours: hours, minutes: minutes, seconds: seconds, unit: inputUnit)
        return pace
    }
    
    func getConversionDistance() -> Double {
        if inputUnit == "mile" {
            return milesToKilometers(distance)
        } else {
            return kilometersToMiles(distance)
        }
    }
    
}
