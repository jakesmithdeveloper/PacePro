//
//  RaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/25/22.
//

import SwiftUI

struct RaceEditView: View {
    
    @EnvironmentObject var dataController: DataController
    @StateObject var vm: RaceEditViewModel
    
    @State private var editMode: Bool
    
    var body: some View {
        VStack {
            if editMode == true {
                Form {
                    Section("Race Information") {
                        TextFieldWithText(userInput: $vm.name.onChange {
                            vm.update()
                        }, prompt: "Race Name:")
                        DatePicker("race date", selection: $vm.date.onChange {
                            vm.update()
                        }, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        TextFieldWithText(userInput: $vm.website.onChange {
                            vm.update()
                        }, prompt: "Race website:")
                        if vm.date > Date() {
                            Text("Countdown: \(vm.countdownString)")
                        }
                    }
                }
                .scrollDismissesKeyboard(.immediately)
            } else {
                RaceDetailView(race: vm.race, vm: vm)
            }
            
        }
        .onDisappear {
            dataController.save()
        }
        .toolbar {
            Button(editMode ? "done" : "edit") {
                vm.updateWithPhoto()
                
                withAnimation {
                    editMode.toggle()
                    dataController.save()
                }
            }
        }
        .navigationTitle("\(vm.raceYearString) \(vm.race.raceName)")
    }
    
    init(race: Race, editMode: Bool) {
        _vm = StateObject(wrappedValue: RaceEditViewModel(race: race))
        _editMode = State(wrappedValue: editMode)
    }
    
}

struct RaceView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            RaceEditView(race: Race.example, editMode: true)
        }
    }
}
