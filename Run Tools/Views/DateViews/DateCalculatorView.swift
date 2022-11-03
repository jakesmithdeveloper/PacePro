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
            VStack(alignment: .leading) {
                
                NavigationLink {
                    TrainingBlockLengthView()
                } label: {
                    Label("Training Block Length", systemImage: "calendar.circle")
                        .foregroundColor(colorScheme == .dark ? .primary : .blue)
                }
                .font(.title)
                .padding()
                .overlay  {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 5)
                }
                .padding()
                Group {
                    Text("Training Block Length (in weeks)")
                        .bold()
                    Text("computed with your training start date and your race date to show you how many weeks you have to train")
                }
                    .padding(.leading, 20)
                
                NavigationLink {
                    StartDateView()
                } label: {
                    Label("Start Date", systemImage: "forward.fill")
                        .foregroundColor(colorScheme == .dark ? .primary : .blue)
                }
                .font(.title)
                .padding()
                .overlay  {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 5)
                }
                .padding()
                Group {
                    Text("Start Date")
                        .bold()
                        .padding(.top, 5)
                    Text("computed with your race date and training block length")
                }
                .padding(.leading, 20)
                
                
                NavigationLink {
                    RaceDateView()
                } label: {
                    Label("Race Date", systemImage: "flag.circle")
                        .foregroundColor(colorScheme == .dark ? .primary : .blue)
                }
                .font(.title)
                .padding()
                .overlay  {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 5)
                }
                .padding()
                Group {
                    Text("Race Date")
                        .bold()
                        .padding(.top, 5)
                    Text("computed with your training start date and training block length")
                }
                .padding(.leading, 20)
                Spacer()
            }
            .navigationTitle("Date calculator")


        }
    }
}

struct DateCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        DateCalculatorView()
    }
}
