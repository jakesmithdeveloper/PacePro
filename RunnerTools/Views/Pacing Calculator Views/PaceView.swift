//
//  PaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

struct PaceView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink {
                    GoalPaceView()
                } label: {
                    Label("Goal Pace", systemImage: "figure.walk")
                }
                .bold()
                .foregroundColor(colorScheme == .dark ? .primary : .blue)
                .padding(20)
                .font(.title)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 5)
                }
                .padding()
                Text("Or")
                    .font(.title)
                    .bold()
                NavigationLink {
                    GoalTimeView()
                } label: {
                    Label("Finish Time", systemImage: "timer.square")
                }
                .bold()
                .foregroundColor(colorScheme == .dark ? .primary : .blue)
                .padding(20)
                .font(.title)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 5)
                }
                .padding()
                Spacer()
                Spacer()
            }
            .navigationTitle("Choose to calculate")
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
