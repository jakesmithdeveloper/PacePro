//
//  RaceLogoPickers.swift
//  Run Tools
//
//  Created by Jake Smith on 11/30/22.
//

import SwiftUI

struct RaceLogoPickers: View {
    
    @ObservedObject var vm: RaceEditViewModel
    
    @State private var bgColor: Color
    @State private var foreGroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Race Logo Editor")
                .font(.title2)
                .bold()
            Group {
                HStack {
                    Text("Background Color: ")
                    ColorPicker("Background Color", selection: $bgColor.onChange {
                        vm.logoBackgroundColor = bgColor.toHex() ?? "#FFFFFF"
                    })
                        .labelsHidden()
                }
                HStack {
                    Text("Text Color: ")
                    ColorPicker("Text Color", selection: $foreGroundColor.onChange {
                        vm.logoTextColor = foreGroundColor.toHex() ?? "#000000"
                    })
                        .labelsHidden()
                }
                RaceImgLogoPicker(logoName: $vm.logoSfSymbol)
            }
            .presentationDetents([ .fraction(0.3), .medium])
        }
    }
    
    init(vm: RaceEditViewModel) {
        self.vm = vm
        
        _bgColor = State(wrappedValue: Color(hex: vm.logoBackgroundColor) ?? .blue)
        _foreGroundColor = State(wrappedValue: Color(hex: vm.logoTextColor) ?? .white)
        
    }
    
}
