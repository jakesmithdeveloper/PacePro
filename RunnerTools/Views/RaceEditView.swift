//
//  RaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/25/22.
//

import SwiftUI

struct RaceEditView: View {
    
    @EnvironmentObject var dataController: DataController

    @StateObject var vm: ViewModel
    
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        VStack {
            Form {
                Section("Race Information") {
                    TextFieldWithText(userInput: $vm.name.onChange {
                        vm.update()
                    }, prompt: "Race Name:")
                    DatePicker("race date", selection: $vm.date.onChange {
                        vm.update()
                    }, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    TextField("Race Website", text: $vm.website.onChange {
                        vm.update()
                    })
                        .focused($keyboardFocused)
                    if vm.date > Date() {
                        Text("Countdown: \(vm.countdownString)")
                    }
                }
            }
            
        }
        .onDisappear {
            dataController.save()
        }
        .navigationTitle("\(vm.raceYearString) \(vm.race.raceName)")
    }
    
    init(race: Race) {
        _vm = StateObject(wrappedValue: ViewModel(race: race))
    }
    
}

struct RaceView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            RaceEditView(race: Race.example)
        }
    }
}
