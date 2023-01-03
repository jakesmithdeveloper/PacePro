//
//  RaceDateView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct RaceDateView: View {
    
    @StateObject private var vm = DateCalculatorViewModel()
    
    var body: some View {
        Form {
            Section("User Input") {
                DatePicker("Start Date", selection: $vm.startDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                HStack {
                    Text("training plan length:")
                        .lineLimit(1)
                    TextField("Training Plan Length", text: $vm.trainingBlockLength, prompt: Text("(weeks)"))
                        .frame(maxWidth: 64)
                        .keyboardType(.numberPad)
                    if vm.trainingBlockLength != "" {
                        Text("(weeks)")
                    }
                }
            }
            
            Section("Race Date") {
                Text("\(vm.raceDateResult)")
                    .font(.title3)
                    .bold()
            }

            if vm.raceDateResult != "" {
                Section("Calendar") {
                    CalendarView(start: vm.startDate, end: vm.computeRaceDate(startDate: vm.startDate, trainingLength: Int(vm.trainingBlockLength)!)!)
                }
            }
            
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle("Race Date")
    }
}

struct RaceDateView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDateView()
    }
}
