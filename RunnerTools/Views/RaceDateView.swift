//
//  RaceDateView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct RaceDateView: View {
    @FocusState private var trainingBlockIsFocused: Bool
    
    @State private var startDate = Date()
    @State private var trainingBlockLength = ""
    
    var result: String {
        guard let weeks = Int(trainingBlockLength) else {  return "" }
        guard let date = computeStartDate(raceDate: startDate, trainingLength: weeks) else { return "" }
        
        return dateToString(date)
    }
    
    var body: some View {
        Form {
            Section("User Input") {
                DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                HStack {
                    Text("training plan length:")
                    TextField("Training Plan Length", text: $trainingBlockLength, prompt: Text("(weeks)"))
                        .keyboardType(.numberPad)
                        .focused($trainingBlockIsFocused)
                }
            }
            Section("Output") {
                Text("Race Date: \(result)")
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
    
    func computeStartDate(raceDate: Date, trainingLength: Int) -> Date? {
        return Calendar.current.date(byAdding: .weekOfYear, value: trainingLength, to: raceDate)
    }
    
    func dateToString(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df.string(from: date)
    }
}

struct RaceDateView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDateView()
    }
}
