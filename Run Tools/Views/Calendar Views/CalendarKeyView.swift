//
//  CalendarKeyView.swift
//  RunnerTools
//
//  Created by Jake Smith on 10/3/22.
//

import SwiftUI

struct CalendarKeyView: View {
    var body: some View {
        HStack {
            Capsule()
                .fill(.green)
                .frame(width: 16, height: 16)
            Text("start date")
                .font(.caption2)
            Capsule()
                .fill(.blue)
                .frame(width: 16, height: 16)
            Text("or")
                .font(.caption2)
            Capsule()
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                }
            Text("training block")
                .font(.caption2)
            Capsule()
                .fill(.red)
                .frame(width: 16, height: 16)
            Text("race date")
                .font(.caption2)
        }
    }
}

struct CalendarKeyView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarKeyView()
    }
}
