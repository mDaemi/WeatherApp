//
//  WelcomePageView.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct WelcomePageView: View {
    @State private var shouldNavigate = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 56) {
                    Text(localized("welcomePage.title"))
                        .foregroundColor(.primary)
                        .font(.system(size: 20))
                        .padding(.horizontal, 24)
                        .padding(.top, geometry.size.height*0.2)
                        .lineSpacing(16)
                        .frame(alignment: .center)
                    
                    Button(localized("welcomePage.button")) {
                        shouldNavigate = true
                    }.foregroundColor(.white)
                        .frame(maxWidth: .infinity,  alignment: .center)
                        .frame(height: 48)
                        .background(.green)
                        .cornerRadius(8)
                        .font(.system(size: 20, weight: .bold))
                        .padding()
                    Spacer()
                    
                    if shouldNavigate {
                        NavigationLink(
                            destination: WeatherPageView(),
                            isActive: $shouldNavigate,
                            label: { EmptyView() }
                        )
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
