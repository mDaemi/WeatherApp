//
//  GaugeProgressStyle.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    // MARK: - Properties
    var strokeColor = Color.blue
    var strokeWidth = 25.0

    // MARK: - Internal
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
