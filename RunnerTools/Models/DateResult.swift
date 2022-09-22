//
//  DateResult.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/21/22.
//

import Foundation

struct DateResult {
    let weeks: Int?
    let days: Int?
    let hours: Int?
    
    var weeksString: String {
        guard let weeks = weeks else { return "" }
        guard weeks > 0 else { return "" }
        return "\(weeks) week\(weeks != 1 ? "s" : "")"
    }
    var daysString: String {
        guard let days = days else { return "" }
        guard days > 0 else { return "" }
        return "\(days) day\(days != 1 ? "s" : "")"
    }
    var hoursString: String {
        guard let hours = hours else { return "" }
        return "\(hours) hour\(hours != 1 ? "s" : "")"
    }
    
    var dateResultString: String {
        "\(weeksString) \(daysString)"
    }
}
