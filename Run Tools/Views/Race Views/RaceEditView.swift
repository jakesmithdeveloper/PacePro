//
//  RaceView.swift
//  Run Tools
//
//  Created by Jake Smith on 11/22/22.
//

import SwiftUI

struct RaceEditView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var vm: RaceEditViewModel
    
    @State private var showingUrlAlert = false
    
    @State private var showingColorPicker = false
    
    @State private var backgroundColor = Color.purple
    @State private var textColor = Color.white
    @State private var sfSymbol = "flag.checkered.2.crossed"
    
    var body: some View {
        Form {
            Section("Race Information") {
                RaceImgPlaceholder(raceName: vm.name, backgroundColor: backgroundColor, textColor: textColor, logo: sfSymbol)
                    .onTapGesture {
                        showingColorPicker = true
                    }
                
                TextFieldWithText(userInput: $vm.name.onChange {
                    vm.update()
                }, prompt: "Race Name:")
                DatePicker("race date", selection: $vm.date.onChange {
                    vm.update()
                }, displayedComponents: [.date])
                .datePickerStyle(.compact)
                HStack {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(colorScheme == .dark ? .primary : .blue)
                        .onTapGesture {
                            showingUrlAlert = true
                        }

                    TextFieldWithText(userInput: $vm.website.onChange {
                        vm.update()
                    }, prompt: "Race website:")
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .alert("Race URL", isPresented: $showingUrlAlert, actions: {
            Button("ok", role: .cancel) {}
        }, message: {
            Text("The race url is used for creating a link to the race page, as well as displaying the race's preview image")
        })
        .sheet(isPresented: $showingColorPicker) {
            RaceLogoPickers(backgroundColor: $backgroundColor, textColor: $textColor, sfSymbol: $sfSymbol)
        }
    }
}

struct RaceEditView_Previews: PreviewProvider {
    static var previews: some View {
        RaceEditView()
    }
}
