//
//  RaceDateView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct RaceDateView: View {
    
    @StateObject private var vm = DateCalculatorViewModel()
    
    @FocusState private var trainingBlockIsFocused: Bool
    
    var body: some View {
        Form {
            Section("User Input") {
                DatePicker("Start Date", selection: $vm.startDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                HStack {
                    Text("training plan length:")
                    TextField("Training Plan Length", text: $vm.trainingBlockLength, prompt: Text("(weeks)"))
                        .keyboardType(.numberPad)
                        .focused($trainingBlockIsFocused)
                }
            }
            Section("Output") {
                Text("Race Date: \(vm.raceDateResult)")
            }
        }
        .navigationTitle("Race Date")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("done") {
                    trainingBlockIsFocused = false
                }
            }
        }
    }
}

struct RaceDateView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDateView()
    }
}
