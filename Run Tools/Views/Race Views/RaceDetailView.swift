//
//  RaceDetailView.swift
//  RunnerTools
//
//  Created by Jake Smith on 10/3/22.
//

import SwiftUI

struct RaceImgPlaceholder: View {

    let raceName: String
    let backgroundColor: Color
    let textColor: Color
    let logo: String
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .fill(backgroundColor)
                    .scaledToFit()
                Spacer()
            }
            VStack {
                Text("\(raceName)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(textColor)
                Image(systemName: logo)
                    .font(.system(size: 96))
                    .padding()
                    .foregroundColor(textColor)
            }
        }
    }
}

struct RaceDetailView: View {
    
    
    let race: Race
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var vm: RaceEditViewModel
    
    @State private var showingColorPicker = false
    
    @State private var backgroundColor = Color.purple
    @State private var textColor = Color.white
    @State private var sfSymbol = "flag.checkered.2.crossed"
    
    var body: some View {
        Form {
            Section("Race information") {
                if vm.imgURL == "" || vm.imgURL == "no-image" {
                    RaceImgPlaceholder(raceName: race.raceName, backgroundColor: backgroundColor, textColor: textColor, logo: sfSymbol)
                        .onTapGesture {
                            showingColorPicker = true
                        }
                } else {
                    AsyncImage(url: URL(string: vm.imgURL)!) { img in
                        img
                            .resizable()
                            .scaledToFit()
                            
                    } placeholder: {
                        ZStack {
                            RaceImgPlaceholder(raceName: race.raceName, backgroundColor: backgroundColor, textColor: textColor, logo: sfSymbol)
                                .onTapGesture {
                                    showingColorPicker = true
                                }
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
        .sheet(isPresented: $showingColorPicker) {
            RaceLogoPickers(backgroundColor: $backgroundColor, textColor: $textColor, sfSymbol: $sfSymbol)
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
