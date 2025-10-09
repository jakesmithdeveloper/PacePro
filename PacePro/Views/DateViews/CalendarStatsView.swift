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
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .foregroundColor(AppTheme.primaryAccent)
                    .font(.title3)
                Text("\(String(Calendar.current.component(.year, from: Date()))) Stats")
                    .font(AppTheme.titleFont)
                    .fontWeight(.bold)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                StatRowView(
                    icon: "calendar",
                    label: "Current Date",
                    value: dateAsString
                )
                StatRowView(
                    icon: "chart.bar.fill",
                    label: "Month Progress",
                    value: monthOfYearRatio
                )
                StatRowView(
                    icon: "chart.line.uptrend.xyaxis",
                    label: "Week Progress",
                    value: weekOfYearRatio
                )
                StatRowView(
                    icon: "hourglass",
                    label: "Remaining Year",
                    value: vm.computeTrainingBlockLength(start: Date(), end: lastDayOfYear).dateResultString
                )
            }
        }
        .cardStyle()
    }
}

// Helper view for stat rows
struct StatRowView: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(AppTheme.primaryAccent)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
    }
}

struct CalendarStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarStatsView()
    }
}
