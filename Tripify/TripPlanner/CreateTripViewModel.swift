//
//  CreateTripViewModel.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/14/23.
//

import Foundation
import CoreData

class CreateTripViewModel: ObservableObject
{
    @Published var name = ""
    @Published var destination = ""
    @Published var startDate = Date()
    @Published var endDate = Date()

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext)
    {
        self.context = context
    }

    func saveTrip()
    {
        let trip = Trip(context: context)
        trip.name = name
        trip.destination = destination
        trip.startDate = startDate
        trip.endDate = endDate

        do
        {
            try context.save()
           
        } catch
        {
            print("Failed to save trip: \(error.localizedDescription)")
        }

        name = ""
        destination = ""
        startDate = Date()
        endDate = Date()
    }
}
