//
//  TrackDistancePresets.swift
//  Run Tools
//
//  Created by Jake Smith on 12/9/22.
//

import SwiftUI

struct TrackDistancePresets: View {
    
    @Binding var distance: String
    let presets = ["100", "200", "400", "800", "1200", "1600"]
    
    var body: some View {
        HStack {
            Text("presets: ")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(presets, id: \.self) { preset in
                        Text(preset)
                            .tag(preset)
                            .padding(5)
                            .scaledToFit()
                            .bold()
                            .foregroundColor(.white)
                            .background {
                                Color.blue
                            }
                            .cornerRadius(10)
                            .onTapGesture {
                                distance = preset
                            }
                    }
                }
                .padding()
            }
        }
    }
}
