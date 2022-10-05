//
//  CalendarView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/30/22.
//

import SwiftUI

enum CellType {
    case inRange, startDay, endDay, outOfRange
}

struct CalendarView: View {
    
    @StateObject var vm: CalendarViewModel
    
    let start: Date
    let end: Date
    
    var body: some View {
        VStack {
            MonthPicker()
            VStack(spacing: 1) {
                ForEach(0..<6) { row in
                    HStack(spacing: 1) {
                        ForEach(1..<8) { column in
                            let count = ((column + (row * 7)) - (vm.firstDay)) + 1
                            CalendarCellView(value: vm.parseCount(count: count), cellType: vm.parseCellType(count: count, start: start, end: end))
                        }
                    }
                }
            }
            CalendarKeyView()
        }
        .environmentObject(vm)
    }
    
    init(start: Date, end: Date) {
        self.start = start
        self.end = end
        
        _vm = StateObject(wrappedValue: CalendarViewModel(calendarMonth: start))
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(start: Calendar.current.date(from: DateComponents(year: 2022, month: 10, day: 3))!, end: Calendar.current.date(from: DateComponents(year: 2022, month: 10, day: 26))!)
    }
}
