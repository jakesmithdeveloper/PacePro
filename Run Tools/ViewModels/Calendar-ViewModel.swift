//
//  Calendar-ViewModel.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/30/22.
//

import Foundation

class CalendarViewModel: ObservableObject {
    
    @Published var calendarMonth: Date
    
    init(calendarMonth: Date) {
        self.calendarMonth = calendarMonth
    }
    
    let calendar = Calendar.current
    let df = DateFormatter()

    var firstDay: Int {
        firstDayOfTheMonth(monthDate: calendarMonth)
    }
    
    var totalDays: Int {
        daysInMonth(calendarMonth)
    }
    
    var previousMonthsDays: Int {
        let previousMonth = returnPreviousMonth(date: calendarMonth)
        return daysInMonth(previousMonth)
    }
    
    func setCalendarMonth(month: Date) {
        self.calendarMonth = month
    }
    
    func parseCount(count: Int) -> Int {
        if count > 0 && count < (totalDays + 1) {
            // inside current month
            return count
        } else if count <= 0 {
            // prvious month
            return previousMonthsDays + count
        } else {
            // next month
            return count - totalDays
        }
    }
    
    func parseCellType(count: Int, start: Date, end: Date) -> CellType {
        
        let startOfDayStart = calendar.startOfDay(for: start)
        let startOfDayEnd = calendar.startOfDay(for: end)
        
        let dateInterval = DateInterval(start: startOfDayStart, end: startOfDayEnd)
        let currentMonthComponents = calendar.dateComponents([.month, .year], from: calendarMonth)
        let dc = DateComponents(year: currentMonthComponents.year, month: currentMonthComponents.month, day: count)
        guard let date = calendar.date(from: dc) else { return .outOfRange }

        if count > 0 && count < (totalDays + 1) {
            if date == startOfDayStart {
                return .startDay
            } else if date == startOfDayEnd {
                return .endDay
            } else if dateInterval.contains(date) {
                return .inRange
            } else {
                return .outOfRange
            }
        } else if count > 0 && dateInterval.contains(date) {
            return .afterMonthInRange
        } else if count <= 0 && dateInterval.contains(date) {
            return .beforeMonthInRange
        }
        return .outOfRange
    }
    
    
    func monthYearAsString() -> String {
        df.dateFormat = "LLL yyyy"
        return df.string(from: calendarMonth)
    }
    
    func returnNextMonth(date: Date) -> Date {
        guard let newDate = calendar.date(byAdding: .month, value: 1, to: calendarMonth) else { return Date() }
        return newDate
    }
    
    func returnPreviousMonth(date: Date) -> Date {
        guard let newDate = calendar.date(byAdding: .month, value: -1, to: calendarMonth) else { return Date() }
        return newDate
    }
    
    func returnNextDay(date: Date) -> Date {
        guard let newDate = calendar.date(byAdding: .day, value: 1, to: date) else { return Date() }
        return newDate
    }
    
    func daysInMonth(_ date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func firstDayOfTheMonth(monthDate: Date) -> Int {
        let dc = calendar.dateComponents([.month, .year], from: monthDate)
        guard let date = calendar.date(from: dc) else { return 0 }
        guard let firstDay = calendar.dateComponents([.weekday], from: date).weekday else { return 0 }
        return firstDay
    }
    
    func lastDayOfTheMonth(monthDate: Date) -> Int {
        let dc = calendar.dateComponents([.month, .year], from: monthDate)
        guard let date = calendar.date(from: dc) else { return 0 }
        let nextMonth = returnNextMonth(date: date)
        guard let lastDayDate = calendar.date(byAdding: .day, value: -1, to: nextMonth) else { return 0 }
        guard let lastDay = calendar.dateComponents([.day], from: lastDayDate).day else { return 0 }
        return lastDay + 1
    }
    
    func firstDateOfTheMonth(monthDate: Date) -> Date {
        let dc = calendar.dateComponents([.month, .year], from: monthDate)
        guard let date = calendar.date(from: dc) else { return Date() }
        return date
    }
    
    func lastDateOfTheMonth(monthDate: Date) -> Date {
        let dc = calendar.dateComponents([.month, .year], from: monthDate)
        guard let date = calendar.date(from: dc) else { return Date() }
        let nextMonth = returnNextMonth(date: date)
        guard let lastDayDate = calendar.date(byAdding: .day, value: -1, to: nextMonth) else { return Date() }
        return lastDayDate
    }
}
