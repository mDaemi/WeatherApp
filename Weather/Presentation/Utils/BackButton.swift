//
//  BackButton.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.black)
            Text(localized("weatherPage.back"))
                .font(.system(size: 18))
                .foregroundColor(.black)
        }
    }
}
