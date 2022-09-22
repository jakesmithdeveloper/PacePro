//
//  StartDateView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct StartDateView: View {
    
    @FocusState private var trainingBlockIsFocused: Bool
    
    @State private var raceDate = Date()
    @State private var trainingBlockLength = ""
    
    var result: String {
        guard let weeks = Int(trainingBlockLength) else {  return "" }
        guard let date = computeStartDate(raceDate: raceDate, trainingLength: weeks) else { return "" }
        
        return dateToString(date)
    }
    
    var body: some View {
        Form {
            Section("User Input") {
                DatePicker("Race Date", selection: $raceDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                HStack {
                    Text("training plan length:")
                    TextField("Training Plan Length", text: $trainingBlockLength, prompt: Text("(weeks)"))
                        .keyboardType(.numberPad)
                        .focused($trainingBlockIsFocused)
                }
            }
            Section("Output") {
                Text("Start Date: \(result)")
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
    
    func computeStartDate(raceDate: Date, trainingLength: Int) -> Date? {
        return Calendar.current.date(byAdding: .weekOfYear, value: -trainingLength, to: raceDate)
    }
    
    func dateToString(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df.string(from: date)
    }
}

struct StartDateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartDateView()
        }
    }
}
