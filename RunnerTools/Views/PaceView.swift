//
//  PaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct PaceView: View {
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    NavigationLink {
                        GoalPaceView()
                    } label: {
                        Label("Goal Pace", systemImage: "figure.walk")
                    }
                    NavigationLink {
                        Text("Goal Time")
                    } label: {
                        Label("Goal Time", systemImage: "timer.square")
                    }
                }
                .foregroundColor(.blue)
                .padding(20)
                .font(.title)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 5)
                }
                .padding()
            }
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
