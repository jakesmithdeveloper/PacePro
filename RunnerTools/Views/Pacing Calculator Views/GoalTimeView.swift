//
//  GoalTimeView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct GoalTimeView: View {
    
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
                        Text("/ \(vm.outputUnit)")
                    }
                    .keyboardType(.numberPad)
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
    }
}

struct GoalTimeView_Previews: PreviewProvider {
    static var previews: some View {
        GoalTimeView()
    }
}
