//
//  AddFlightTripView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/20/23.
//

import Foundation
import SwiftUI

struct AddFlightTripView: View
{
    @ObservedObject var viewModel: AddFlightTripViewModel
    let trip: Trip

    var body: some View
    {
        Form
        {
            Section(header: Text("Flight Details"))
            {
                TextField("Flight Number", text: $viewModel.flightnum)
                TextField("Airline", text: $viewModel.airline)
                TextField("Arrival", text: $viewModel.arrival)
                TextField("Departure", text: $viewModel.departure)
            }
            Section
            {
                Button(action:{
                    viewModel.saveFlight(for: trip)
                }) {
                    Text("Save")
                }
            }
        }
        .navigationBarTitle("Add Flight")
    }
}
