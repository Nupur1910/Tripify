//
//  CreateTripView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/14/23.
//

import SwiftUI

struct CreateTripView: View
{
    @ObservedObject var viewModel: CreateTripViewModel

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

            Section
            {
                Button(action: viewModel.saveTrip)
                {
                    Text("Save")
                }
            }
            
        }
       // .navigationBarTitle("Create Trip")
    
    }
}

