//
//  RaceView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/25/22.
//

import SwiftUI

struct RaceView: View {
    
    
    @EnvironmentObject var dataController: DataController
    
    @StateObject var vm: RaceEditViewModel
    
    @State private var editMode: Bool
    
    var body: some View {
        VStack {
            if editMode == true {
                RaceEditView()
                    .environmentObject(vm)
            } else {
                RaceDetailView(race: vm.race, vm: vm)
            }
            
        }
        .onDisappear {
            dataController.save()
        }
        .toolbar {
            Button(editMode ? "done" : "edit") {
                vm.update()
                
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
            RaceView(race: Race.example, editMode: true)
        }
    }
}
