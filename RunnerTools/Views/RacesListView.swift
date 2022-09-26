//
//  RacesListView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/23/22.
//

import SwiftUI

struct RacesListView: View {
    
    @EnvironmentObject var dataController: DataController
    
    let races: FetchRequest<Race>
    
    @State private var raceStack: [Race] = []
    
    var body: some View {
        NavigationStack(path: $raceStack) {
            List {
                ForEach(races.wrappedValue) { race in
                    NavigationLink(race.raceName, value: race)
                }
                .onDelete { offsets in
                    for offset in offsets {
                        let race = races.wrappedValue[offset]
                        dataController.delete(race)
                    }
                    dataController.save()
                }
            }
            .navigationTitle("Upcomming Races")
            .toolbar {
                Button {
                    let race = Race(context: dataController.container.viewContext)
                    raceStack.append(race)
                } label: {
                    Label("add", systemImage: "plus")
                }
            }
            .navigationDestination(for: Race.self) { race in
                RaceView(race: race)
            }
        }
    }
    
    init() {
        races = FetchRequest<Race>(entity: Race.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Race.date, ascending: true)])
    }
}

struct RacesListView_Previews: PreviewProvider {
    
    static var dataController = DataController.preview
    
    static var previews: some View {
        RacesListView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
