//
//  UseCaseProvider.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

protocol UseCaseProvider {
    func provideAppUseCase() -> PAppUseCase
}
