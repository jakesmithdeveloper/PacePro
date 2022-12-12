//
//  TextFieldWithText.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/26/22.
//

import SwiftUI

struct TextFieldWithText: View {
    
    @Binding var userInput: String
    let prompt: String
    let placeholder: String
    
    var body: some View {
        HStack {
            Text(prompt)
            TextField(placeholder, text: $userInput)
        }
    }
}

//struct TextFieldWithText_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldWithText(userInput: <#T##Binding<String>#>, prompt: "")
//    }
//}
