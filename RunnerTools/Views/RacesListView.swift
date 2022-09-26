//
//  RacesListView.swift
//  RunnerTools
//
//  Created by Jake Smith on 9/23/22.
//

import SwiftUI

struct RacesListView: View {
    
    @EnvironmentObject var dataController: DataController
    
    // Fetch requests for upcomming and past races
    let upcommingRaces: FetchRequest<Race>
    let pastRaces: FetchRequest<Race>
    
    // Race path array for programatically navigations with the new Navigation Stack
    @State private var raceStack: [Race] = []
    
    var body: some View {
        NavigationStack(path: $raceStack) {
            List {
                // Display races that haven't happened yet if there are any available
                if upcommingRaces.wrappedValue.count > 0 {
                    Section("Upcomming Races") {
                        ForEach(upcommingRaces.wrappedValue) { race in
                            NavigationLink("\(race.raceName) (\(race.raceDateString!))", value: race)
                        }
                        .onDelete { offsets in
                            for offset in offsets {
                                let race = upcommingRaces.wrappedValue[offset]
                                dataController.delete(race)
                            }
                            dataController.save()
                        }
                    }
                }
                
                // Display races that have happened if there are any available
                if pastRaces.wrappedValue.count > 0 {
                    Section("Past Races") {
                        ForEach(pastRaces.wrappedValue) { race in
                            NavigationLink(race.raceName, value: race)
                        }
                        .onDelete { offsets in
                            for offset in offsets {
                                let race = pastRaces.wrappedValue[offset]
                                dataController.delete(race)
                            }
                            dataController.save()
                        }
                    }                    
                }
            }
            .navigationTitle("Races")
            .toolbar {
                Button {
                    let race = Race(context: dataController.container.viewContext)
                    raceStack.append(race)
                } label: {
                    Label("add", systemImage: "plus")
                }
            }
            // New NavigationStack syntax
            .navigationDestination(for: Race.self) { race in
                RaceEditView(race: race)
                    .toolbar {
                        // add a done button to pop the edit race view
                        Button("done") {
                            raceStack = [Race]()
                        }
                    }
            }
        }
    }
    
    init() {
        upcommingRaces = FetchRequest<Race>(entity: Race.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Race.date, ascending: true)], predicate: NSPredicate(format: "date > %@", argumentArray: [Date()]))
        
        pastRaces = FetchRequest<Race>(entity: Race.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Race.date, ascending: true)], predicate: NSPredicate(format: "date <= %@", argumentArray: [Calendar.current.startOfDay(for: Date())]))
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
