//
//  ValidationManager.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 28/08/2023.
//

import Foundation
class ValidationManager {
    static let shared = ValidationManager()
    private init () {}
        func containsOnlyDoubleNumbers(_ input: String) -> Bool {
            return Double(input) != nil
    }
}
