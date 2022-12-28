//
//  DateCalculatorView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/20/22.
//

import SwiftUI

struct DateCalculatorView: View {

    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    Group {
                        NavigationLink {
                            TrainingBlockLengthView()
                        } label: {
                            Label("Training Block Length", systemImage: "calendar.circle")
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink {
                            StartDateView()
                        } label: {
                            Label("Training Start Date", systemImage: "figure.run")
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink {
                            RaceDateView()
                        } label: {
                            Label("Race Date Calculator", systemImage: "flag.checkered")
                                .foregroundColor(.white)
                        }
                    }
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                    }
                    .padding()
                    
                    
                    CalendarStatsView()
                    
                }
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
