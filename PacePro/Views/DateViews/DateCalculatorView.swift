//
//  DateCalculatorView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/20/22.
//

import SwiftUI

struct DateCalculatorView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: AppTheme.cardSpacing) {
                    NavigationLink {
                        TrainingBlockLengthView()
                    } label: {
                        HStack {
                            Image(systemName: "calendar.circle")
                                .font(.title2)
                            Text("Training Block Length")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    .navigationCardStyle()
                    
                    NavigationLink {
                        StartDateView()
                    } label: {
                        HStack {
                            Image(systemName: "figure.run")
                                .font(.title2)
                            Text("Training Start Date")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    .navigationCardStyle()
                    
                    NavigationLink {
                        RaceDateView()
                    } label: {
                        HStack {
                            Image(systemName: "flag.checkered")
                                .font(.title2)
                            Text("Race Date Calculator")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    .navigationCardStyle()
                    
                    CalendarStatsView()
                        .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle("Date Calculators")
        }
    }
}

struct DateCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        DateCalculatorView()
    }
}
