//
//  CalendarStatsView.swift
//  Run Tools
//
//  Created by Jake Smith on 12/6/22.
//

import SwiftUI

struct CalendarStatsView: View {
    
    var vm = DateCalculatorViewModel()
    
    var dateAsString: String {
        let df = DateFormatter()
        df.dateStyle = .long
        return df.string(from: Date())
    }
    
    var firstdayOfNextYear: Date {
        let year = Calendar.current.component(.year, from: Date())
        if let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 1, month: 1, day: 1)) {
            return firstOfNextYear
        } else {
            return Date()
        }
    }
    
    var lastDayOfYear: Date {
        let year = Calendar.current.component(.year, from: Date())
        if let lastOfYear = Calendar.current.date(from: DateComponents(year: year, month: 12, day: 31)) {
            return lastOfYear
        } else {
            return Date()
        }
    }
    
    var weekOfYearRatio: String {
        let weekOfYear = Calendar.current.component(.weekOfYear, from: Date())
        return "\(weekOfYear) of 52"
    }
    
    var monthOfYearRatio: String {
        let monthOfYear = Calendar.current.component(.month, from: Date())
        return "\(monthOfYear) of 12"
    }
    
    
    var body: some View {
        VStack {
            Text("\(String(Calendar.current.component(.year, from: Date()))) Stats")
                .bold()
                .foregroundColor(.secondary)
                .font(.title3)
            VStack(alignment: .leading) {
                BoldCategoryView(beforeColon: "Current Date", afterColon: dateAsString)
                BoldCategoryView(beforeColon: "Month", afterColon: monthOfYearRatio)
                BoldCategoryView(beforeColon: "Week", afterColon: weekOfYearRatio)
                BoldCategoryView(beforeColon: "Remaining Year", afterColon: vm.computeTrainingBlockLength(start: Date(), end: lastDayOfYear).dateResultString)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue, lineWidth: 2)
        }
        .padding()
    }
}

struct CalendarStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarStatsView()
    }
}
