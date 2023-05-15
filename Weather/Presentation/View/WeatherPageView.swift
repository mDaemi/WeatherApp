//
//  WeatherPageView.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct WeatherPageView: View {
    @State private var value : Float = 0
    @State private var loadingMessage: String = localized("weatherPage.message1")
    @State private var restart: Bool = true
    let loadingTime: Float = 20

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 48) {
                if restart {
                    Text(loadingMessage)
                        .foregroundColor(.primary)
                        .font(.system(size: 18, weight: .bold))
                        .frame(alignment: .center)
                        .frame(maxWidth: .infinity)
                        .lineSpacing(8)
                        .padding(8)

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
                                    value += 1
                                    
                                    if Int(value).isMultiple(of: 6) {
                                        loadingMessage = getNextMessage(of: loadingMessage)
                                    }
                                    
                                    if value == loadingTime {
                                        timer.invalidate()
                                        restart = false
                                        value = 0
                                    }
                                }
                            }
                    }
                    
                } else {
                    Button("Start") {
                        restart = true
                    }
                }
            }.padding()
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

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 25.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

struct WeatherPageView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPageView()
    }
}
