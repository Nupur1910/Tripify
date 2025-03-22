//
//  MenuView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/14/23.
//


import Foundation
import SwiftUI
import CoreData

struct MenuView: View
{
    
    @Environment(\.managedObjectContext) private var viewContext
        
    @State private var isCreateTripPresented = false
    @State private var isTripListPresented = false
    @State private var isDeleteTripPresented = false
    @State private var isAddTripPresented = false
    @State private var isAddFlightPresented = false
    
    var body: some View
    {
        
       
        NavigationView
        {
            GeometryReader
            { geometry in
                ZStack(alignment: .top)
                {
                    Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height / 4)
                    .clipped()
                }
                .ignoresSafeArea(edges: .top)
                VStack(alignment: .center, spacing: 30)
                {
                    Spacer()
                    Spacer()
                    
                    Button(action: { isCreateTripPresented.toggle()})
                    {
                        Text("Create Trip")
                        .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 15)
                    .padding()
                    .background(Color.teal)
                    .cornerRadius(30)
                           
                    
                    NavigationLink(destination: AddTrip(), isActive: $isAddTripPresented)
                    {
                        Text("Add Accommodation")
                        .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 15)
                    .padding()
                    .background(Color.teal)
                    .cornerRadius(30)
                           
                    
                    NavigationLink(destination: AddFlight(), isActive: $isAddFlightPresented)
                    {
                        Text("Add Flight")
                        .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 15)
                    .padding()
                    .background(Color.teal)
                    .cornerRadius(30)
                           
                    
                    NavigationLink(destination: TripListView(), isActive: $isTripListPresented)
                    {
                        Text("View/Edit Trip")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 15)
                        .padding()
                        .background(Color.teal)
                        .cornerRadius(30)
                    }
                    
                    NavigationLink(destination: DeleteTrip(), isActive: $isDeleteTripPresented)
                    {
                        Text("Remove Trip")
                        .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 15)
                    .padding()
                    .background(Color.teal)
                    .cornerRadius(30)
                           
                    NavigationLink(destination: WeatherSearchView())
                    {
                        Text("Weather Updates")
                        .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 15)
                    .padding()
                    .background(Color.teal)
                    .cornerRadius(30)
                           
                          
                    NavigationLink(destination: MapView())
                    {
                        Text("Get Recommendations")
                        .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 15)
                    .padding()
                    .background(Color.teal)
                    .cornerRadius(30)
                    Spacer()
                    
                           
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .sheet(isPresented: $isCreateTripPresented)
            {
            CreateTripView(viewModel: CreateTripViewModel(context: viewContext))
            }
        }
    }
}

}
