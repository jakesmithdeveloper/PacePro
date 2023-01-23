//
//  GoalPaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct GoalPaceView: View {

    @ObservedObject var vm = PaceViewModel()
    @State private var showingActualFinishTime = false
    
    var body: some View {
        Form {
            Section("User Input") {
                PresetDistanceView(vm: vm)
                TextField("distance", text: $vm.distanceInput)
                    .keyboardType(.decimalPad)
                Picker("Distance Type", selection: $vm.inputUnit) {
                    ForEach(vm.units, id: \.self) {
                        Text("\($0)s")
                    }
                }
                .pickerStyle(.segmented)
                HStack {
                    Text("finish time:")
                        .font(.caption)
                    Group {
                        TextField("hours", text: $vm.hoursIput)
                        Text(":")
                        TextField("minutes", text:$vm.minutesInput)
                        Text(":")
                        TextField("seconds", text: $vm.secondsIput)
                    }
                    .keyboardType(.numberPad)
                }
            }
            
            Section("Goal Pace") {
                if vm.noInput {
                    Text("Your goal pace will be calculated using distance and finish time values")
                } else {
                    Text("\(vm.result) / \(vm.outputUnit)")
                    Picker("Distance Type", selection: $vm.outputUnit) {
                        ForEach(vm.units, id: \.self) {
                            Text("\($0)s")
                        }
                    }
                    .pickerStyle(.segmented)
                    if showingActualFinishTime {
                        Text("Actual Finish Time: \(vm.actualTimeResult)")
                    } else {
                        Button("actual finish time") {
                            withAnimation {
                                showingActualFinishTime = true
                            }
                        }
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle("Goal Pace Calculator")
        .onDisappear {
            vm.resetViewModel()
            showingActualFinishTime = false
        }
        .toolbar {
            Button("Reset") {
                vm.resetViewModel()
            }
        }
    }
}

struct GoalPaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GoalPaceView()
        }
    }
}
