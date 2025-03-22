//
//  AddAccommodationTripView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/18/23.
//

import Foundation
import SwiftUI

struct AddAccommodationTripView: View
{
    @ObservedObject var viewModel: AddAccommodationTripViewModel
    let trip: Trip

    var body: some View
    {
        Form
        {
            Section(header: Text("Accommodation Details"))
            {
                TextField("Name", text: $viewModel.name)
                TextField("Address", text: $viewModel.address)
                DatePicker("Check-in Date", selection: $viewModel.checkinDate, displayedComponents: .date)
                DatePicker("Check-out Date", selection: $viewModel.checkoutDate, displayedComponents: .date)
            }
            Section
            {
                Button(action:{
                    viewModel.saveAccommodation(for: trip)
                }) {
                    Text("Save")
                }
            }
        }
        .navigationBarTitle("Add Accommodation")
    }
}
