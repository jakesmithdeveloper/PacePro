//
//  TrackMode-ViewModel.swift
//  Run Tools
//
//  Created by Jake Smith on 12/12/22.
//

import Foundation

extension TrackModePaceView {
    class ViewModel: ObservableObject {
        
        @Published var distanceString = ""
        @Published var minutesString = ""
        @Published var secondsString = ""
        @Published var outputUnit = "mile"
        @Published var split = 100
        
        var distance: Int {
            return Int(distanceString) ?? 0
        }
        
        var minutes: Int {
            return Int(minutesString) ?? 0
        }
        
        var seconds: Int {
            return Int(secondsString) ?? 0
        }
        
        var paceInSeconds: Int {
            let minutesAsSeconds = minutes * 60
            return seconds + minutesAsSeconds
        }
        
        var cantCalculate: Bool {
            return distance == 0 || paceInSeconds == 0
        }
        
        var resultString: String {
            let time = timeAtSplit(distance: distance, paceInSeconds: paceInSeconds)
            if cantCalculate {
                return "Enter Distance and Pace to calculate split time"
            } else {
                return("\(distance) meters at \(time)")
            }
        }
        
        func metersToMiles(meters: Int) -> Double {
            return Double(meters) / 1609
        }
        
        func metersToKm(meters: Int) -> Int {
            return meters * 1000
        }
        
        func kmPaceToMinPace() -> Double {
            return Double(paceInSeconds) * 1.60934
        }
        
        func totalSecondsToTime(seconds: Int) -> String {
            let minutes = Int(seconds) / 60 % 60
            let seconds = Int(seconds) % 60
            return ("\(minutes > 0 ? "\(String(minutes)):" : "00:")\(seconds >= 10 ? String(seconds) : "0\(String(seconds))")")
        }
        
        func timeAtSplit(distance: Int, paceInSeconds: Int) -> String {
            let mtm = metersToMiles(meters: distance)
            var secondsResult = 0.0
            if outputUnit == "mile" {
                secondsResult = Double(paceInSeconds) * mtm
            } else {
                secondsResult = kmPaceToMinPace() * mtm
            }
            return totalSecondsToTime(seconds: Int(secondsResult))
        }
        
        func reset() {
            distanceString = ""
            minutesString = ""
            secondsString = ""
        }
        
    }
}
