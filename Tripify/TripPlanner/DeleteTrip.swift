//
//  DeleteTrip.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/17/23.
//

import Foundation
import SwiftUI
import CoreData

struct DeleteTrip: View
{
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Trip.name, ascending: true)])
    private var trips: FetchedResults<Trip>
    
    var body: some View
    {
       
        List
        {
            ForEach(trips)
            { trip in
                
                    Text(trip.name!)
                
            } .onDelete(perform: deleteItems)
        
        }.navigationTitle("Trips")
    
    }
    private func deleteItems(offsets: IndexSet)
    {
        withAnimation
        {
            offsets.map { trips[$0] }.forEach(viewContext.delete)

            do
            {
                try viewContext.save()
            } catch
            {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
