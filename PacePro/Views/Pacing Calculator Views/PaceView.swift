//
//  PaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/22/22.
//

import SwiftUI

extension View {
    func paceCalcNav() -> some View {
        modifier(PaceCalcNavButton())
    }
}

struct PaceCalcNavButton: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundColor(colorScheme == .dark ? .primary : .blue)
            .padding(20)
            .frame(maxWidth: .infinity)
            .font(.title)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 5)
            }
            .padding()
    }
}

struct PaceView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var showingExplanation = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    NavigationLink {
                        GoalPaceView()
                    } label: {
                        Label("Goal Pace", systemImage: "figure.run")
                    }
                    .paceCalcNav()
                    

                    NavigationLink {
                        GoalTimeView()
                    } label: {
                        Label("Finish Time", systemImage: "clock")
                    }
                    .paceCalcNav()

                    NavigationLink {
                        TrackModePaceView()
                    } label: {
                        Label("Track Workout", systemImage: "stopwatch")
                    }
                    .paceCalcNav()

                    if showingExplanation {
                        VStack(alignment: .center) {
                            Group {
                                BoldCategoryView(beforeColon: "Goal Pace", afterColon: "Calculate the average pace needed to finish a race in the given time")
                                BoldCategoryView(beforeColon: "Finish Time", afterColon: "Calculate the total time of the race for a given average pace")
                                BoldCategoryView(beforeColon: "Track Workout", afterColon: "Calculate splits for track workouts given a target pace")
                            }
                            .font(.footnote)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue, lineWidth: 2)
                        }
                        .padding()
                    }
                    
                    Text("\(showingExplanation ? "hide" : "show info  ")")
                        .onTapGesture {
                            withAnimation {
                                showingExplanation.toggle()
                            }
                        }
                        .font(.footnote)
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .padding(.top, 30)
            }
            .navigationTitle("Pace Calculators")
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
