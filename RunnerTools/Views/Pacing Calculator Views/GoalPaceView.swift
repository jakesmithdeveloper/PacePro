//
//  GoalPaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct GoalPaceView: View {
    
    @ObservedObject var vm = PaceViewModel()

    var body: some View {
        Form {
            Section("User Input") {
                TextField("distance", text: $vm.distanceInput)
                    .keyboardType(.decimalPad)
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
    }
}

struct GoalPaceView_Previews: PreviewProvider {
    static var previews: some View {
        GoalPaceView()
    }
}
