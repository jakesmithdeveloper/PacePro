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
    func body(content: Content) -> some View {
        content
            .navigationCardStyle()
    }
}

struct PaceView: View {
    
    @State private var showingExplanation = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: AppTheme.cardSpacing) {
                    NavigationLink {
                        GoalPaceView()
                    } label: {
                        HStack {
                            Image(systemName: "figure.run")
                                .font(.title2)
                            Text("Goal Pace")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    .paceCalcNav()
                    

                    NavigationLink {
                        GoalTimeView()
                    } label: {
                        HStack {
                            Image(systemName: "clock")
                                .font(.title2)
                            Text("Finish Time")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    .paceCalcNav()

                    NavigationLink {
                        TrackModePaceView()
                    } label: {
                        HStack {
                            Image(systemName: "stopwatch")
                                .font(.title2)
                            Text("Track Workout")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    .paceCalcNav()

                    // Info Panel
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                showingExplanation.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(AppTheme.primaryAccent)
                                Text(showingExplanation ? "Hide Details" : "Show Details")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .rotationEffect(.degrees(showingExplanation ? 180 : 0))
                                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: showingExplanation)
                            }
                            .foregroundColor(AppTheme.primaryAccent)
                            .padding(.bottom, showingExplanation ? 8 : 0)
                        }
                        
                        if showingExplanation {
                            VStack(alignment: .leading, spacing: 8) {
                                InfoRowView(
                                    icon: "figure.run",
                                    title: "Goal Pace",
                                    description: "Calculate the average pace needed to finish a race in the given time"
                                )
                                
                                InfoRowView(
                                    icon: "clock",
                                    title: "Finish Time",
                                    description: "Calculate the total time of the race for a given average pace"
                                )
                                
                                InfoRowView(
                                    icon: "stopwatch",
                                    title: "Track Workout",
                                    description: "Calculate splits for track workouts given a target pace"
                                )
                            }
                        }
                    }
                    .cardStyle()
                    .padding(.top, 8)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Pace Calculators")
        }
    }
}

// Helper view for info rows
struct InfoRowView: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(AppTheme.primaryAccent)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
