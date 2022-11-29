//
//  RaceDetailView.swift
//  RunnerTools
//
//  Created by Jake Smith on 10/3/22.
//

import SwiftUI

struct RaceImgPlaceholder: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let raceName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(colorScheme == .dark ? Color.purple : Color(red: 0.101, green: 0.107, blue: 0.3))
                .scaledToFit()
            VStack {
                Text("\(raceName)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Image(systemName: "flag.checkered.2.crossed")
                    .font(.system(size: 96))
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

struct RaceDetailView: View {
    
    let race: Race
    @ObservedObject var vm: RaceEditViewModel
    
    var body: some View {
        Form {
            Section("Race information") {
                if vm.imgURL == "" || vm.imgURL == "no-image" {
                    RaceImgPlaceholder(raceName: race.raceName)
                } else {
                    AsyncImage(url: URL(string: vm.imgURL)!) { img in
                        img
                            .resizable()
                            .scaledToFit()
                            
                    } placeholder: {
                        RaceImgPlaceholder(raceName: race.raceName)
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
