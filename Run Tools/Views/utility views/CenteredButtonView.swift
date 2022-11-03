//
//  CenteredButtonView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/21/22.
//

import SwiftUI

struct CenteredButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(title, action: action)
            Spacer()
        }
    }
}

struct CenteredButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CenteredButtonView(title: "test") {
            print("test")
        }
    }
}
