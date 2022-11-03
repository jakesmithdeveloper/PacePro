//
//  PresetDistanceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/29/22.
//

import SwiftUI

struct PresetDistanceView: View {
    var vm: PaceViewModel
    
    var body: some View {
        HStack() {
            Text("presets")
                .font(.caption)
                .foregroundColor(.secondary)
            Group {
                Text("5k") .onTapGesture {
                    vm.setDistanceInput(distance: "5", inputUnit: "kilometer")
                }
                Text("10k") .onTapGesture {
                    vm.setDistanceInput(distance: "10", inputUnit: "kilometer")
                }
                Text("13.1") .onTapGesture {
                    vm.setDistanceInput(distance: "13.1", inputUnit: "mile")
                }
                Text("26.2") .onTapGesture {
                    vm.setDistanceInput(distance: "26.2", inputUnit: "mile")
                }
            }
            .padding(5)
            .foregroundColor(.white)
            .background {
                Color.blue
            }
            .cornerRadius(10)
        }
    }
}
