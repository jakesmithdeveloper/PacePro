//
//  TrackModePaceView.swift
//  Run Tools
//
//  Created by Jake Smith on 12/7/22.
//

import SwiftUI

struct TrackModePaceView: View {
    
    @State private var distanceString = ""
    @State private var minutesString = ""
    @State private var secondsString = ""
    @State private var outputUnit = "mile"
    @State private var split = 100
    @State private var showingSplits = false
    
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
            return("\(distance) at \(time)")
        }
    }
    
    
    let units = ["mile", "kilometer"]
    
    var body: some View {
        Form {
            Section("Distance") {
                TrackDistancePresets(distance: $distanceString)
                HStack {
                    TextFieldWithText(userInput: $distanceString, prompt: "Distance:", placeholder: "400m")
                        .keyboardType(.numberPad)
                    Text("/ meters")
                }
            }
            
            Section("Pace") {
                HStack {
                    Text("Average Pace:")
                        .font(.caption)
                    Group {
                        TextField("minutes", text: $minutesString)
                            .keyboardType(.numberPad)
                        TextField("seconds", text: $secondsString)
                            .keyboardType(.numberPad)
                            
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
            
            Section("Result") {
                Text("\(resultString)")
                if cantCalculate == false {
                    if showingSplits {
                        Stepper("splits at every \(split) meters", value: $split, step: 100)
                        List {
                            ForEach(Array(stride(from: split, through: distance, by: split)), id: \.self) { split in
                                Text("\(String(split)) : \(timeAtSplit(distance: split, paceInSeconds: paceInSeconds))")
                            }
                        }
                    }
                    Button("\(showingSplits ? "hide" : "show") splits") {
                        withAnimation {
                            showingSplits.toggle()
                        }
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle("Track Calculator")
    }
    
    
    func metersToMiles(meters: Int) -> Double {
        return Double(meters) * 0.000621371
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
        return ("\(minutes > 0 ? "\(String(minutes)):" : "")\(seconds >= 10 ? String(seconds) : "0\(String(seconds))")")
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
    
}

struct TrackModePaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TrackModePaceView()
        }
    }
}
