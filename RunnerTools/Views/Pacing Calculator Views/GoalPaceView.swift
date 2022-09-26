//
//  GoalPaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct GoalPaceView: View {
    
    @FocusState private var keyboardIsFocused: Bool
    @ObservedObject var vm = PaceViewModel()

    var body: some View {
        Form {
            Section("User Input") {
                TextField("distance", text: $vm.distanceInput)
                    .keyboardType(.decimalPad)
                    .focused($keyboardIsFocused)
                Picker("Distance Type", selection: $vm.inputUnit) {
                    ForEach(vm.units, id: \.self) {
                        Text("\($0)s")
                    }
                }
                .pickerStyle(.segmented)
                HStack {
                    Group {
                        TextField("hours", text: $vm.hoursIput)
                        TextField("minutes", text:$vm.minutesInput)
                        TextField("seconds", text: $vm.secondsIput)
                    }
                    .keyboardType(.numberPad)
                    .focused($keyboardIsFocused)
                }
            }
            
            Section("output") {
                Text("\(vm.result) / \(vm.outputUnit)")
                Picker("Distance Type", selection: $vm.outputUnit) {
                    ForEach(vm.units, id: \.self) {
                        Text("\($0)s")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Goal Pace Calculator")
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("done") {
                    keyboardIsFocused = false
                }
            }
        }
    }
}

struct GoalPaceView_Previews: PreviewProvider {
    static var previews: some View {
        GoalPaceView()
    }
}
