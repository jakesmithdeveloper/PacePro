//
//  RaceDetailView.swift
//  RunnerTools
//
//  Created by Jake Smith on 10/3/22.
//

import SwiftUI

struct RaceDetailView: View {
    
    let race: Race
    @ObservedObject var vm: RaceEditViewModel
    
    var body: some View {
        Form {
            Section("Race information") {
                if vm.imgURL != "" {
                    AsyncImage(url: URL(string: vm.imgURL)!) { img in
                        img
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.gray
                    }

                }
                
                HStack {
                    Text("Name: ")
                    Text(race.raceName)
                }
                HStack {
                    Text("Race Date: ")
                    Text(race.raceDateString ?? "")
                }
                
                if race.raceWebsite != "" && URL(string: race.raceWebsite) != nil {
                    HStack {
                        Link("Race Website", destination: URL(string: race.raceWebsite)!)
                    }
                }
                
                Text("Race Countdown: \(vm.countdownString)")
            }
        }
    }
    
    init(race: Race, vm: RaceEditViewModel) {
        self.race = race
        self.vm = vm
    }
    
}

struct RaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailView(race: Race.example, vm: RaceEditViewModel(race: Race.example))
    }
}
