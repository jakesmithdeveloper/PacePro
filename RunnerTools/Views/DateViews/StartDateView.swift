//
//  StartDateView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct StartDateView: View {
    
    @StateObject private var vm = DateCalculatorViewModel()
    
    @FocusState private var trainingBlockIsFocused: Bool
    
    var body: some View {
        Form {
            Section("User Input") {
                DatePicker("Race Date", selection: $vm.raceDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                HStack {
                    Text("training plan length:")
                    TextField("Training Plan Length", text: $vm.trainingBlockLength, prompt: Text("(weeks)"))
                        .keyboardType(.numberPad)
                        .focused($trainingBlockIsFocused)
                }
            }
            Section("Output") {
                Text("Start Date: \(vm.startDateResult)")
            }
        }
        .navigationTitle("Start Date")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("done") {
                    trainingBlockIsFocused = false
                }
            }
        }
    }
}

struct StartDateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartDateView()
        }
    }
}
