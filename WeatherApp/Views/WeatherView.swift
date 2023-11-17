//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Carlos Pineda on 17/11/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5 ) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack {
                    HStack {
                        VStack{
                            VStack(spacing: 20) {
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                                
                                Text(weather.weather[0].main)
                            }
                            .frame(width: 150, alignment: .leading)
                        }
                        Spacer()
                        Text(weather.main.feelsLike.RoundDouble()+"°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                        
        
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://pixabay.com/get/gc880d379bb96d81b59fcd4dbf2eee921a0b442f5cf2f29cadbcd8da6f7547d3f42f60b42671183990e8d3820180e34354725cbb4f2a0379d2a660667013ac988_1280.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temperature", value: (weather.main.tempMin.RoundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temperature", value: (weather.main.tempMax.RoundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.RoundDouble() + " m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.tempMax.RoundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
