//
//  WelcomePageView.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct WelcomePageView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 56) {
                Text(localized("title.welcomePage"))
                    .foregroundColor(.primary)
                    .font(.system(size: 20))
                    .padding(.horizontal, 24)
                    .padding(.top, 100)
                    .lineSpacing(8)
                    .frame(alignment: .center)
                
                Button(localized("welcomePage.button")) {
                    
                }
                Spacer()
            }
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
