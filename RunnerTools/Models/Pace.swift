//
//  Pace.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import Foundation

enum RunningUnit {
    case mile, kilometer
}

struct Pace {
    let hours: Int
    let minutes: Int
    let seconds: Int
    
    let unit: String
    
    var paceString: String {
        String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}
