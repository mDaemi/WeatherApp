//
//  String+Extension.swift
//  Weather
//
//  Created by Maedeh DAEMI on 15/05/2023.
//

import Foundation

func localized(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

extension String: Identifiable {
    public var id: String { self }
}
