//
//  RaceImgLogoPicker.swift
//  Run Tools
//
//  Created by Jake Smith on 11/30/22.
//

import SwiftUI

struct RaceImgLogoPicker: View {
    
    @Binding var logoName: String
    
    let sfSymbolNames = ["figure.walk", "figure.run", "figure.run.circle", "figure.roll.runningpace", "figure.outdoor.cycle", "figure.track.and.field", "trophy.circle", "trophy.circle.fill", "medal", "flag.checkered", "flag.checkered.2.crossed", "stopwatch"]
    
    var body: some View {
        HStack {
            Text("Image: ")
            Picker("logo", selection: $logoName) {
                ForEach(sfSymbolNames, id: \.self) { sfSymbol in
                    Image(systemName: sfSymbol)
                        .resizable()
                        .font(.system(size: 64))
                }
            }
        }
    }
}

struct RaceImgLogoPicker_Previews: PreviewProvider {
    
    @State static private var logo = "figure.run"
    
    static var previews: some View {
        RaceImgLogoPicker(logoName: $logo)
    }
}
