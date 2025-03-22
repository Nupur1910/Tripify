//
//  WeatherViewModel.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/21/23.
//

import Foundation

class WeatherViewModel: ObservableObject
{
    @Published var weatherData: WeatherData?

    func getWeatherData(for city: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=bd44159ef817e6502ca3ff06861b7e11") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    self.weatherData = weatherData
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct WeatherData: Codable
{
    let main: Main
    
}

struct Main: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

