//
//  TrainingBlockLengthView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/21/22.
//

import SwiftUI

struct TrainingBlockLengthView: View {
    
    @State private var startDate = Date()
    @State private var raceDate = Date()
    
    var dateResult: DateResult {
        compute(start: startDate, end: raceDate)
    }
    
    var body: some View {
        Form {
            Section("User input") {
                DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                DatePicker("Race Date", selection: $raceDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
            }
            
            Section("result") {
                Text(dateResult.dateResultString)
            }
        }
        .navigationTitle("Training Block Length")
    }
    
    func compute(start: Date, end: Date) -> DateResult {
        let diffComponents = Calendar.current.dateComponents([.weekOfYear, .day, .hour], from: Calendar.current.startOfDay(for: start), to: Calendar.current.startOfDay(for: end))
        
        return DateResult(weeks: diffComponents.weekOfYear, days: diffComponents.day, hours: diffComponents.hour)
    }
    
}

struct TrainingBlockLengthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrainingBlockLengthView()
        }
    }
}
