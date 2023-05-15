//
//  WeatherPageView.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct WeatherPageView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = WeatherViewModel()
    @State private var value : Float = 0
    @State private var loadingMessage: String = localized("weatherPage.message1")
    @State private var showProgressView: Bool = true
    @State private var fetchDataFailed = false
    let loadingTime: Float = 60
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 48) {
                if showProgressView {
                    Text(loadingMessage)
                        .foregroundColor(.primary)
                        .font(.system(size: 18, weight: .bold))
                        .frame(alignment: .center)
                        .frame(maxWidth: .infinity)
                        .lineSpacing(8)
                        .padding()
                    
                    ZStack {
                        ProgressView(value: value, total: loadingTime)
                            .progressViewStyle(GaugeProgressStyle())
                            .frame(width: 150, height: 150)
                            .contentShape(Rectangle())
                            .overlay(
                                Text("\(Int(value)) %")
                                    .foregroundColor(.primary)
                                    .font(.system(size: 24, weight: .bold))
                            )
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                                    
                                    if value == 0 {
                                        fetchData(for: "Rennes")
                                    } else if value == 10 {
                                        fetchData(for: "Paris")
                                    } else if value == 20 {
                                        fetchData(for: "Nantes")
                                    } else if value == 30 {
                                        fetchData(for: "Bordeaux")
                                    } else if value == 40 {
                                        fetchData(for: "Lyon")
                                    }
                                    
                                    value += 1
                                    if Int(value).isMultiple(of: 6) {
                                        loadingMessage = getNextMessage(of: loadingMessage)
                                    }
                                    if value == loadingTime {
                                        if vm.weather.count == 5 {
                                            fetchDataFailed = false
                                            print("YooHoooooo")
                                        } else {
                                            fetchDataFailed = true
                                        }
                                        
                                        timer.invalidate()
                                        showProgressView = false
                                        value = 0
                                    }
                                }
                            }
                    }
                } else {
                    if !fetchDataFailed {
                        List {
                            ForEach(vm.weather.indices, id: \.self) { index in
                                let cell = vm.weather[index]
                                WeatherDataCell(vm: WeatherDataCellViewModel(
                                    cityName: cell.cityName,
                                    temp: cell.temp, clouds: cell.clouds))
                            }
                        }
                        .listStyle(PlainListStyle())
                            .padding()
                            .frame(maxHeight: .infinity)
                    }
                    
                    ButtonStyle {
                        Button(localized("weatherPage.restart")) {
                            showProgressView = true
                        }
                    }.padding(.bottom, 8)
                }
                
                if fetchDataFailed {
                    SnackView(message: localized("weatherPage.service"), bgColor: .red)
                        .transition(.move(edge: .bottom))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    fetchDataFailed = false
                                }
                            }
                        }
                }
            }.padding()
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButton()
                }))
        }
    }
    
    // MARK: - Private
    private func fetchData(for city: String) {
        Task {
            do {
                try await vm.getData(for: city)
            } catch {
                fetchDataFailed = true
                showProgressView = false
            }
        }
    }
    
    private func getNextMessage(of currentMessage: String) -> String {
        var nextMessage = ""
        let messages: [String] = [localized("weatherPage.message1"),
                                  localized("weatherPage.message2"),
                                  localized("weatherPage.message3")]
        messages.enumerated().forEach { (key, value) in
            if value == currentMessage {
                if key == 2 {
                    nextMessage = messages.first!
                } else {
                    nextMessage = messages[key+1]
                }
            }
        }
        return nextMessage
    }
}

struct WeatherPageView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPageView()
    }
}
