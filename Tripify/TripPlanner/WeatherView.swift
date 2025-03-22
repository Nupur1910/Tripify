//
//  WeatherView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/21/23.
//

import Foundation
import SwiftUI
import UIKit

struct WeatherSearchView: View
{
    @State private var searchText: String = ""
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search for a city...")
                .onChange(of: searchText) { text in
                    viewModel.getWeatherData(for: text)
                }
        
            if let weatherData = viewModel.weatherData
            {
                Image("Weather")
                VStack {
                    Text("Temperature: \(weatherData.main.temp) K")
                    Text("Pressure: \(weatherData.main.pressure) hPa")
                    Text("Humidity: \(weatherData.main.humidity)%")
                    Text("Min Temperature: \(weatherData.main.temp_min) K")
                    Text("Max Temperature: \(weatherData.main.temp_max) K")
                }
            }

            

        }
        .navigationBarTitle("Weather Search")
    }
}
