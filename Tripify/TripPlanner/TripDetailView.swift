//
//  TripDetailView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/14/23.
//

/*import SwiftUI

struct TripDetailView: View
{
    @Environment(\.managedObjectContext) private var viewContext
    
    let trip: Trip
   
    @State private var name: String
    @State private var destination: String
    @State private var startDate: Date
    @State private var endDate: Date
    
    
    
   /* init(trip: Trip)
    {
        self.trip = trip
        
        _name = State(initialValue: trip.name ?? "")
        _destination = State(initialValue: trip.destination ?? "")
        _startDate = State(initialValue: trip.startDate ?? Date())
        _endDate = State(initialValue: trip.endDate ?? Date())
    }*/
    
    
    var body: some View
    {
        Form
        {
            Section(header: Text("Trip Details"))
            {
                /*TextField("Name", text: $name)
                TextField("Destination", text: $destination)
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)*/
                TextField("Name", text: Binding(
                                   get: { trip.name ?? "" },
                                   set: { trip.name = $0 }))
                TextField("Destination", text: Binding(
                                   get: { trip.destination ?? "" },
                                   set: { trip.destination = $0 }))
                DatePicker("Start Date", selection: Binding(
                                    get: { trip.startDate ?? Date() },
                                    set: { trip.startDate = $0 }),
                                           displayedComponents: .date)
                DatePicker("End Date", selection: Binding(
                                  get: { trip.endDate ?? Date() },
                                  set: { trip.endDate = $0 }),
                                         displayedComponents: .date)
            }
            
            
           
            Section
            {
                Button("Save")
                {
                    saveChanges()
                }
                .foregroundColor(.blue)
            }
            
            
            Section(header: Text("Accommodation Details")) {
                            ForEach(Array(trip.accommodation ?? []), id: \.self) { accommodation in
                                VStack(alignment: .leading) {
                                    Text(accommodation.name ?? "")
                                        .font(.headline)
                                    Text(accommodation.address ?? "")
                                        .font(.subheadline)
                                    HStack {
                                        Text("Check-in Date: ")
                                        Spacer()
                                        Text(accommodation.checkinDate?.toString() ?? "")
                                    }
                                    HStack {
                                        Text("Check-out Date: ")
                                        Spacer()
                                        Text(accommodation.checkoutDate?.toString() ?? "")
                                    }
                                }
                            }
                        }
        }
        .onAppear
        {
            name = trip.name ?? ""
            destination = trip.destination ?? ""
            startDate = trip.startDate ?? Date()
            endDate = trip.endDate ?? Date()
        }
        .navigationTitle("Trip Details")
    }
    
    private func saveChanges()
    {
        trip.name = name
        trip.destination = destination
        trip.startDate = startDate
        trip.endDate = endDate
        
        do
        {
            try viewContext.save()
        } catch
        {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
*/

import SwiftUI
import CoreData
struct TripDetailView: View
{
    @ObservedObject var viewModel: TripDetailViewModel
    
    init(trip: Trip, context: NSManagedObjectContext)
    {
        viewModel = TripDetailViewModel(trip: trip, context: context)
    }
    
    var body: some View
    {
        Form
        {
            Section(header: Text("Trip Details"))
            {
                TextField("Name", text: $viewModel.name)
                TextField("Destination", text: $viewModel.destination)
                DatePicker("Start Date", selection: $viewModel.startDate, displayedComponents: .date)
                DatePicker("End Date", selection: $viewModel.endDate, displayedComponents: .date)
            }
            
            Section(header: Text("Accommodations"))
            {
                ForEach(viewModel.accommodations)
                { accommodation in
                    AccommodationRow(accommodation: accommodation)
                }
            }
            
            Section(header: Text("Flights"))
            {
                ForEach(viewModel.flights)
                { flight in
                    FlightRow(flight : flight)
                }
            }
            
            Section
            {
                
                Button(action: viewModel.saveTrip)
                {
                    Text("Save")
                }
            }
        }
        .navigationBarTitle(viewModel.name)
    }
}

struct AccommodationRow: View
{
    let accommodation: Accommodation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(accommodation.name ?? "")
            Text(accommodation.address ?? "")
            Text("\(accommodation.checkinDate ?? Date(), formatter: DateFormatter.dateOnlyFormatter) - \(accommodation.checkoutDate ?? Date(), formatter: DateFormatter.dateOnlyFormatter)")
                .font(.caption)
        }
    }
}


struct FlightRow: View
{
    let flight: Flight
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(flight.flightnum ?? "")
            Text(flight.airline ?? "")
            Text(flight.arrival ?? "")
            Text(flight.departure ?? "")
        }
    }
}
