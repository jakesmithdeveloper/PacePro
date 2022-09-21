//
//  DateCalculatorView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/20/22.
//

import SwiftUI

struct DateCalculatorView: View {
    
    @State private var showDetails = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Group {
                    NavigationLink {
                        TrainingBlockLengthView()
                    } label: {
                        Label("Training Block Length", systemImage: "calendar.circle")
                    }
                    
                    NavigationLink {
                        Text("Start date")
                    } label: {
                        Label("Start Date", systemImage: "forward.fill")
                    }
                    
                    NavigationLink {
                        Text("Race Date")
                    } label: {
                        Label("Race Date", systemImage: "flag.circle")
                    }
                }
                .font(.title)
                .padding()
                .overlay  {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 5)
                }
                .padding()
                HStack {
                    Spacer()
                    Button("\(showDetails ? "hide" : "show") details") {
                        withAnimation {
                            showDetails.toggle()
                        }
                    }
                    Spacer()
                }
                if showDetails {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Group {
                                Text("Training Block Length (in weeks)")
                                    .bold()
                                Text("computed with your training start date and your race date to show you how many weeks you have to train")
                                
                                Text("Race Date")
                                    .bold()
                                    .padding(.top, 5)
                                Text("computed with your training start date and training block length")
                                
                                Text("Start Date")
                                    .bold()
                                    .padding(.top, 5)
                                Text("computed with your race date and training block length")
                            }
                            .padding(.leading, 20)
                        }
                    }
                }
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
