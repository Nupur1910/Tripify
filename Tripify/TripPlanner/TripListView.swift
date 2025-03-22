//
//  TripListView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/14/23.
//

import Foundation
import SwiftUI
import CoreData

struct TripListView: View
{
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Trip.name, ascending: true)])
    private var trips: FetchedResults<Trip>
    
    var body: some View
    {
        List
        {
            ForEach(trips)
            {trip in
                NavigationLink(destination: TripDetailView(trip: trip, context: viewContext))
                {
                    Text(trip.name!)
                }
            }
        
        }.navigationTitle("Trips")
    }
    
}
