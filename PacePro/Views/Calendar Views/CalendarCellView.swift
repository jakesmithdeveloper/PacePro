//
//  CalendarCellView.swift
//  RunnerTools
//
//  Created by Jake Smith on 10/3/22.
//

import SwiftUI

struct CalendarCellView: View {
    
    let value: Int
    let cellType: CellType
    
    var body: some View {
        switch cellType {
        case .startDay:
            Text("Start")
                .frame(maxWidth: .infinity, minHeight: 32)
                .foregroundColor(.white)
                .background {
                    Color.green
                        .cornerRadius(10)
                }
                .padding(2)
        
        case .endDay:
            Text("Race")
                .frame(maxWidth: .infinity, minHeight: 32)
                .foregroundColor(.white)
                .background {
                    Color.red
                        .cornerRadius(10)
                }
                .padding(2)
        
        case .inRange:
            Text(String(value))
                .frame(maxWidth: .infinity, minHeight: 32)
                .foregroundColor(.white)
                .background {
                    Color.blue
                        .cornerRadius(10)
                }
                .padding(2)
        
        case .afterMonthInRange:
            Text(String(value))
                .frame(maxWidth: .infinity, minHeight: 32)
                .foregroundColor(.gray)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                }
                .padding(2)
            
        case .beforeMonthInRange:
            Text(String(value))
                .frame(maxWidth: .infinity, minHeight: 32)
                .foregroundColor(.gray)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                }
                .padding(2)
            
        case .outOfRange:
            Text(String(value))
                .frame(maxWidth: .infinity, minHeight: 32)
                .padding(2)
                .foregroundColor(.gray)
        }
    }
}
struct CalendarCellView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCellView(value: 2, cellType: .afterMonthInRange)
    }
}
