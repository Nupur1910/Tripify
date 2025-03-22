//
//  AddFlight.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/20/23.
//

import Foundation
import SwiftUI
import CoreData

struct AddFlight: View
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
                NavigationLink(destination: AddFlightTripView(viewModel: AddFlightTripViewModel(context: viewContext), trip: trip))
                {
                    Text(trip.name!)
                }
            }
        
        }.navigationTitle("Trips")
    }
    
}
