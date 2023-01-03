//
//  StartDateView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct StartDateView: View {
    
    @StateObject private var vm = DateCalculatorViewModel()
    
    
    var body: some View {
        Form {
            Section("User Input") {
                DatePicker("Race Date", selection: $vm.raceDate, displayedComponents: [.date])
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

            Section("Training Start Date") {
                Text("\(vm.startDateResult)")
                    .font(.title3)
                    .bold()
            }
            
            if vm.startDateResult != "" {
                Section("Calendar") {
                    CalendarView(start: vm.computeStartDate(raceDate: vm.raceDate, trainingLength: Int(vm.trainingBlockLength)!)!, end: vm.raceDate)
                }
            }
            
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle("Start Date")
    }
}

struct StartDateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartDateView()
        }
    }
}
