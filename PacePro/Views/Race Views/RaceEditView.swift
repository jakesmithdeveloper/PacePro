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
    
    var body: some View {
        Form {
            Section("Race Logo") {
                HStack {
                    Spacer()
                    VStack() {
                        RaceImgPlaceholderView(raceName: vm.name, backgroundColor: vm.logoBackgroundColor, textColor: vm.logoTextColor, logo: vm.logoSfSymbol, editMode: true)
                            .onTapGesture {
                                showingColorPicker = true
                            }
                            .padding()
                        Text("tap logo to change")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            
                    }
                    Spacer()
                }
            }
            Section("Race Information") {
                TextFieldWithText(userInput: $vm.name.onChange {
                    vm.update()
                }, prompt: "Race Name:", placeholder: "")
                
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
                    }, prompt: "Race website:", placeholder: "url")
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .alert("Race URL", isPresented: $showingUrlAlert, actions: {
            Button("ok", role: .cancel) {}
        }, message: {
            Text("The race url is used for creating a link to the race page")
        })
        .sheet(isPresented: $showingColorPicker) {
            RaceLogoPickers(vm: vm)
        }
    }
}

struct RaceEditView_Previews: PreviewProvider {
    static var vm = RaceEditViewModel(race: Race.example)
    
    static var previews: some View {
        RaceEditView()
            .environmentObject(vm)
    }
}
