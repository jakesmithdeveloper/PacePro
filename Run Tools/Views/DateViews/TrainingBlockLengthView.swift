//
//  TrainingBlockLengthView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/21/22.
//

import SwiftUI

struct TrainingBlockLengthView: View {
    
    @StateObject private var vm = DateCalculatorViewModel()
    
    var body: some View {
        VStack {
            Form {
                Section("User input") {
                    DatePicker("Start Date", selection: $vm.startDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                    DatePicker("Race Date", selection: $vm.raceDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                }

                Section("Training Block Length") {
                    Text("\(vm.startDate <= vm.raceDate ? vm.trainingBlockResult.dateResultString : "Race date must be later than start date")")
                        .font(.title3)
                        .bold()
                }

                if !vm.trainingBlockResult.isEmpty {
                    Section("calendar") {
                        CalendarView(start: vm.startDate, end: vm.raceDate)
                    }
                }
                
            }
        }
        .navigationTitle("Training Block Length")
        .onDisappear {
            vm.reset()
        }
    }
}

struct TrainingBlockLengthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrainingBlockLengthView()
        }
    }
}
