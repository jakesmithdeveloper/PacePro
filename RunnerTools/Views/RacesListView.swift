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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(races.wrappedValue) { race in
                    Text(race.name ?? "")
                }
            }
            .navigationTitle("Upcomming Races")
            .toolbar {
                Button {
                    // do something
                } label: {
                    Label("add", systemImage: "plus")
                }

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
