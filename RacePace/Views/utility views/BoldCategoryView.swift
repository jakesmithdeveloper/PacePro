//
//  BoldCategoryView.swift
//  RacePace
//
//  Created by Jake Smith on 12/13/22.
//

import SwiftUI

struct BoldCategoryView: View {
    let beforeColon: String
    let afterColon: String
    
    var body: some View {
        HStack {
            Text("\(beforeColon): ")
                .bold()
                .foregroundColor(.secondary)
            Text(afterColon)
                .foregroundColor(.secondary)
        }
        .padding(2)
    }
}

struct BoldCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        BoldCategoryView(beforeColon: "Category", afterColon: "Text")
    }
}
