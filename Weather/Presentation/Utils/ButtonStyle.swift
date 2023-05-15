//
//  ButtonStyle.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct ButtonStyle<Content>: View where Content: View {
    var views: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.views = content()
    }
    
    var body: some View {
        Group {
            views.foregroundColor(.white)
                .frame(maxWidth: .infinity,  alignment: .center)
                .frame(height: 48)
                .background(.green)
                .cornerRadius(8)
                .font(.system(size: 20, weight: .bold))
                .padding()
        }
    }
}
