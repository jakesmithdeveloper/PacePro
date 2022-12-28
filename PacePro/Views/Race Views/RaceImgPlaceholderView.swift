//
//  RaceImgPlaceholderView.swift
//  Run Tools
//
//  Created by Jake Smith on 12/7/22.
//

import SwiftUI

struct RaceImgPlaceholderView: View {
    
    let raceName: String
    let backgroundColor: String
    let textColor: String
    let logo: String
    let editMode: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            if !editMode {
                Text("\(raceName)")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(Color(hex: textColor))
                    .lineLimit(2)
            }
            Image(systemName: logo)
                .font(.system(size: editMode ? 32 : 64))
                .padding()
                .foregroundColor(Color(hex: textColor))
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .scaledToFill()
                .foregroundColor(Color(hex: backgroundColor))
        }
    }
}

struct RaceImgPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        RaceImgPlaceholderView(raceName: "Autumn Arch Winter Warmer", backgroundColor: "#000080", textColor: "#FFFFFF", logo: "figure.run", editMode: true)
    }
}
