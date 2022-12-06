//
//  DateExtension.swift
//  Run Tools
//
//  Created by Jake Smith on 11/22/22.
//

import Foundation

extension Date {
    func sameDay(as aDate: Date) -> Bool {
        return Calendar.current.startOfDay(for: aDate) == Calendar.current.startOfDay(for: self)
    }
}
