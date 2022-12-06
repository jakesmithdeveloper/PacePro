//
//  RaceLogoPickers.swift
//  Run Tools
//
//  Created by Jake Smith on 11/30/22.
//

import SwiftUI

struct RaceLogoPickers: View {
    
    @Binding var backgroundColor: Color
    @Binding var textColor: Color
    @Binding var sfSymbol: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Race Logo Editor")
                .font(.title2)
                .bold()
            Group {
                HStack {
                    Text("Background Color: ")
                    ColorPicker("Background Color", selection: $backgroundColor)
                        .labelsHidden()
                }
                HStack {
                    Text("Text Color: ")
                    ColorPicker("Text Color", selection: $textColor)
                        .labelsHidden()
                }
                RaceImgLogoPicker(logoName: $sfSymbol)
            }
            .presentationDetents([ .fraction(0.3), .medium])
        }
    }
}

struct RaceLogoPickers_Previews: PreviewProvider {
    @State static private var backgroundColor: Color = .blue
    @State static private var textCOlor: Color = .white
    @State static private var sfSymbol: String = "figure.track.and.field"
    
    static var previews: some View {
        RaceLogoPickers(backgroundColor: $backgroundColor, textColor: $textCOlor, sfSymbol: $sfSymbol)
    }
}
