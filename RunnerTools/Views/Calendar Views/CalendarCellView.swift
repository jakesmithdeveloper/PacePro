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
                .padding(2)
                .background {
                    Color.green
                        .cornerRadius(10)
                }
        
        case .endDay:
            Text("Race")
                .frame(maxWidth: .infinity, minHeight: 32)
                .foregroundColor(.white)
                .padding(2)
                .background {
                    Color.red
                        .cornerRadius(10)
                }
        
        case .inRange:
            Text(String(value))
                .frame(maxWidth: .infinity, minHeight: 32)
                .foregroundColor(.white)
                .padding(2)
                .background {
                    Color.blue
                        .cornerRadius(10)
                }
        
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
        CalendarCellView(value: 2, cellType: .startDay)
    }
}
