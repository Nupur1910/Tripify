//
//  AddAccommodationTripViewModel.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/18/23.
//

import Foundation
import CoreData

class AddAccommodationTripViewModel: ObservableObject
{
    @Published var name = ""
    @Published var address = ""
    @Published var checkinDate = Date()
    @Published var checkoutDate = Date()

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext)
    {
        self.context = context
    }

    func saveAccommodation(for trip: Trip)
    {
        let accommodation = Accommodation(context: context)
        accommodation.name = name
        accommodation.address = address
        accommodation.checkinDate = checkinDate
        accommodation.checkoutDate = checkoutDate
        trip.addToAccommodation = accommodation

        do
        {
            try context.save()
        } catch
        {
            print("Failed to save accommodation: \(error.localizedDescription)")
        }

        name = ""
        address = ""
        checkinDate = Date()
        checkoutDate = Date()
    }
}
