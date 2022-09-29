//
//  GoalTimeView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct GoalTimeView: View {
    
    @FocusState private var keyboardIsFocused: Bool
    @ObservedObject var vm = PaceViewModel()
    
    var body: some View {
        Form {
            Section("User Input") {
                PresetDistanceView(vm: vm)
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
                    Text("Average Pace:")
                        .font(.caption)
                    Group {
                        TextField("hours", text: $vm.hoursIput)
                        TextField("minutes", text:$vm.minutesInput)
                        TextField("seconds", text: $vm.secondsIput)
                        Text("/ \(vm.outputUnit)")
                    }
                    .keyboardType(.numberPad)
                    .focused($keyboardIsFocused)
                }
                Picker("Distance Type", selection: $vm.outputUnit) {
                    ForEach(vm.units, id: \.self) {
                        Text("\($0)s")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("output") {
                Text("\(vm.goalTimeResult)")
            }
        }
        .navigationTitle("Finish Time Calculator")
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("done") {
                    keyboardIsFocused = false
                }
            }
        }
    }
}

struct GoalTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GoalTimeView()            
        }
    }
}
