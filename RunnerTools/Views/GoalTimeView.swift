//
//  GoalTimeView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct GoalTimeView: View {
    @State private var inputUnit = "mile"
    @State private var outputUnit = "mile"
    @State private var distanceInput = ""
    @State private var totalTimeInput = ""
    
    @State private var hoursIput = ""
    @State private var minutesInput = ""
    @State private var secondsIput = ""
    
    let units = ["mile", "kilometer"]
    
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
    
    var body: some View {
        Form {
            Section("User Input") {
                TextField("distance", text: $distanceInput)
                    .keyboardType(.decimalPad)
                Picker("Distance Type", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text("\($0)s")
                    }
                }
                .pickerStyle(.segmented)
                HStack {
                    Group {
                        TextField("hours", text: $hoursIput)
                        TextField("minutes", text:$minutesInput)
                        TextField("seconds", text: $secondsIput)
                        Text("/ \(outputUnit)")
                    }
                    .keyboardType(.numberPad)
                }
                Picker("Distance Type", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text("\($0)s")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("output") {
                Text("\(result)")
            }
        }
    }
    
    func getConversionDistance() -> Double {
        if inputUnit == "mile" {
            return milesToKilometers(distance)
        } else {
            return kilometersToMiles(distance)
        }
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
        return Int(round(Double(seconds) * distance))
    }
    
    func secondsToPace(_ time: Int) -> Pace {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        let pace = Pace(hours: hours, minutes: minutes, seconds: seconds, unit: inputUnit)
        return pace
    }
}

struct GoalTimeView_Previews: PreviewProvider {
    static var previews: some View {
        GoalTimeView()
    }
}
