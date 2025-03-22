//
//  TripDetailViewModel.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/20/23.
//

import Foundation
import SwiftUI
import CoreData

class TripDetailViewModel: ObservableObject {
    @Published var name: String
    @Published var destination: String
    @Published var startDate: Date
    @Published var endDate: Date
    @Published var accommodations: [Accommodation]
    @Published var flights: [Flight]
    
    private let context: NSManagedObjectContext
    private let trip: Trip
    
    init(trip: Trip, context: NSManagedObjectContext)
    {
        self.trip = trip
        self.context = context
        self.name = trip.name ?? ""
        self.destination = trip.destination ?? ""
        self.startDate = trip.startDate ?? Date()
        self.endDate = trip.endDate ?? Date()
    
        if let accommodationsSet = trip.addToAccommodation {
            self.accommodations = Array(arrayLiteral: accommodationsSet) as? [Accommodation] ?? []
            } else {
                self.accommodations = []
            }
            
            if let flightsSet = trip.addToFlight {
                self.flights = Array(arrayLiteral: flightsSet) as? [Flight] ?? []
            } else {
                self.flights = []
            }

    }
    
    func saveTrip()
    {
        trip.name = name
        trip.destination = destination
        trip.startDate = startDate
        trip.endDate = endDate
        
        do {
            try context.save()
        } catch {
            print("Failed to save trip: \(error.localizedDescription)")
        }
    }
}

extension DateFormatter
{
    static let dateOnlyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}





