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
                .font(.caption)
            Capsule()
                .fill(.blue)
                .frame(width: 16, height: 16)
            Text("training block")
                .font(.caption)
            Capsule()
                .fill(.red)
                .frame(width: 16, height: 16)
            Text("race date")
                .font(.caption)
        }
    }
}

struct CalendarKeyView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarKeyView()
    }
}
