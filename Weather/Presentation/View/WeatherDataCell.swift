//
//  WeatherDataCell.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct WeatherDataCell: View {
    @ObservedObject var vm: WeatherDataCellViewModel
    
    var body: some View {
        Group {
            HStack(spacing: 8) {
                VStack(spacing: 8) {
                    Text(vm.cityName)
                        .foregroundColor(.primary)
                        .font(.system(size: 13, weight: .bold))
                    if let temp = vm.temp {
                        Text("\(localized("weatherPage.temperature")): \(temp)")
                            .foregroundColor(.primary)
                            .font(.system(size: 13, weight: .bold))
                            .frame(alignment: .leading)
                    }
                }
                Spacer()
                
                if let cloud = vm.clouds {
                    if cloud <= 30 {
                        Image("SunnyWeather")
                            .resizable()
                            .scaledToFit()
                    } else if cloud > 30 && cloud <= 60 {
                        Image("SemiCloudyWeather")
                            .resizable()
                            .scaledToFit()
                    } else if cloud > 60 {
                        Image("CloudyWeather")
                            .resizable()
                            .scaledToFit()
                    }
                }
                
            }
        }.background(.clear)
            .frame(height: 50)
    }
}
