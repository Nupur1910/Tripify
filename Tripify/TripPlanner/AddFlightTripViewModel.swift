//
//  AddFlightTripViewModel.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/20/23.
//

import Foundation
import CoreData

class AddFlightTripViewModel: ObservableObject
{
    @Published var airline = ""
    @Published var arrival = ""
    @Published var departure = ""
    @Published var flightnum = ""

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext)
    {
        self.context = context
    }

    func saveFlight(for trip: Trip)
    {
        let flight = Flight(context: context)
        flight.airline = airline
        flight.flightnum = flightnum
        flight.arrival = arrival
        flight.departure = departure
        trip.addToFlight = flight

        do
        {
            try context.save()
        } catch
        {
            print("Failed to save flight: \(error.localizedDescription)")
        }

        airline = ""
        flightnum = ""
        arrival = ""
        departure = ""
    }
}
