//
//  TripPlannerApp.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/13/23.
//

import SwiftUI

@main
struct TripPlannerApp: App
{
    let persistenceController = PersistenceController.shared

    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
