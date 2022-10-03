//
//  MonthPicker.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/30/22.
//

import SwiftUI

struct MonthPicker: View {
    
    @EnvironmentObject var vm: CalendarViewModel
    
    var dayNames: some View {
        HStack {
            ForEach(vm.calendar.shortWeekdaySymbols, id: \.self) {
                Text($0)
                    .dayOfWeek()
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Spacer()
                Button {
                    // nothing
                } label: {
                    Image(systemName: "arrow.left")
                }
                .onTapGesture {
                    withAnimation {
                        vm.calendarMonth = vm.returnPreviousMonth(date: vm.calendarMonth)
                    }
                }
                Text(vm.monthYearAsString())
                    .frame(maxWidth: .infinity)
                Button{
                    // do nothing
                } label: {
                    Image(systemName: "arrow.right")
                }
                .onTapGesture {
                    withAnimation {
                        vm.calendarMonth = vm.returnNextMonth(date: vm.calendarMonth)                        
                    }
                }
                Spacer()
            }
            dayNames
        }
    }
}

struct MonthPicker_Previews: PreviewProvider {
    static var previews: some View {
        MonthPicker()
            .environmentObject(CalendarViewModel(calendarMonth: Date()))
    }
}

extension Text
{
    func dayOfWeek() -> some View
    {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
