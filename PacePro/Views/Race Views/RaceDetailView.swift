//
//  RaceDetailView.swift
//  RunnerTools
//
//  Created by Jake Smith on 10/3/22.
//

import SwiftUI

struct RaceDetailView: View {
    
    
    let race: Race
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var vm: RaceEditViewModel
    
    var body: some View {
        Form {
            Section("Race information") {
                if vm.imgURL == "" || vm.imgURL == "no-image" {
                    // if the user doesn't put a race url or if there is no og:image tag found
                    HStack {
                        Spacer()
                        RaceImgPlaceholderView(raceName: race.raceName, backgroundColor: race.racelogoBackgroundColor, textColor: race.raceLogoTextColor, logo: race.raceLogoSfSymbol, editMode: false)
                            .padding()
                        Spacer()
                    }
                } else {
                    AsyncImage(url: URL(string: vm.imgURL)!) { img in
                        img
                            .resizable()
                            .scaledToFit()
                            
                    } placeholder: {
                        HStack {
                            Spacer()
                            RaceImgPlaceholderView(raceName: race.raceName, backgroundColor: race.racelogoBackgroundColor, textColor: race.raceLogoTextColor, logo: race.raceLogoSfSymbol, editMode: false)
                                .padding()
                            Spacer()
                        }
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
                if race.raceDate > Date() || race.raceDate.sameDay(as: Date()) {
                    Text("Race Countdown: \(vm.countdownString == " " ? "Race Day!" : vm.countdownString)")
                        .bold()
                }
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
