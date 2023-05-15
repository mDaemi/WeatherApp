//
//  SnackView.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import SwiftUI

struct SnackView: View {
    var message: String
    var bgColor: Color
    var onUpdate: (() -> Void) = {}
    @State var haveRetryButton: Bool = false
    
    var body: some View {
        HStack {
            Text(message)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.white)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(.top, 14)
                .padding(.bottom, 14)
            if haveRetryButton {
                Button {
                    onUpdate()
                } label: {
                    Text(localized("common.retry.message"))
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(.trailing, 8)

            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(bgColor)
        .cornerRadius(10)
        .padding()
    }
}
